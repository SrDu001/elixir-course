defmodule SocialNetworkServerWeb.Api.V1.PostController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.Post

   def create(conn, %{"user_id" => userid}) do
    %{"content" => content} = conn.body_params
    post = Post.create_post(userid, content)
    json(conn, %{
      id: post.id,
      content: post.content,
      date: post.date,
      user_id: post.user_id
    })
  end

  def index(%Plug.Conn{query_params: query_params} = conn, %{"user_id" => userid}) do
    offset = query_params["offset"]
    limit = query_params["limit"]
    posts = Post.get_friends_posts(userid, offset, limit)
    result_list = Enum.map(posts, fn post -> %{id: post.id, content: post.content, date: post.date, user_id: post.user_id} end )
    json(conn, result_list)
  end
end
