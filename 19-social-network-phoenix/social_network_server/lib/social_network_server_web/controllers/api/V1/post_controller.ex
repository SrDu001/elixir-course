defmodule SocialNetworkServerWeb.Api.V1.PostController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.Post
  alias SocialNetworkServerWeb.Router.Helpers, as: Routes

  def create(conn, %{"userid" => userid, "content" => content}) do
    case Post.create_post(userid, content) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.page_path(WebpackPostgresWeb.Endpoint, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(%Plug.Conn{query_params: query_params} = conn, %{"user_id" => userid}) do
    offset = query_params["offset"]
    limit = query_params["limit"]
    posts = Post.get_friends_posts(userid, offset, limit)
    result_list = Enum.map(posts, fn post -> %{id: post.id, content: post.content, date: post.date, user_id: post.user_id} end )
    json(conn, result_list)
  end
end
