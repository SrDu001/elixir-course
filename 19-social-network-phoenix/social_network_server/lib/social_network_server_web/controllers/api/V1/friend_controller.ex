defmodule SocialNetworkServerWeb.Api.V1.FriendController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.Friend

  def create(%Plug.Conn{query_params: query_params} = conn, %{"user_id" => userid}) do
    %{"friend_id" => friendid} = conn.body_params
    {:ok, friend} = Friend.add_friend(userid, friendid)
    json(conn, %{
      id: friend.id,
      user_id: friend.user_id,
      friend_id: friend.friend_id
    })
  end
end
