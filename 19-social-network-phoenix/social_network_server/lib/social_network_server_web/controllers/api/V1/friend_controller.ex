defmodule SocialNetworkServerWeb.Api.V1.FriendController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.Friend

  def create(conn, %{"user_id" => userid}) do
    %{"friend_id" => friendid} = conn.body_params
    {:ok, friend} = Friend.add_friend(userid, friendid)
    json(conn, %{
      id: friend.id,
      user_id: friend.user_id,
      friend_id: friend.friend_id
    })
  end

  def index(conn, %{"user_id" => userid}) do
    friends = Friend.get_user_friends(userid)
    result_list = Enum.map(friends, fn friend -> %{id: friend.id, friend_id: friend.friend_id, name: friend.friend.name} end)
    json(conn, result_list)
  end
end
