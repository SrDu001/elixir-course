defmodule SocialNetworkServer.Friend do
  use Ecto.Schema

  schema "user_friends" do
    field :user_id, :integer
    field :friend_id, :integer
  end

  alias SocialNetworkServer.{Repo, Friend}

  def add_friend(user, friend_id) do
    %Friend{user_id: user.id, friend_id: friend_id}
    |> Repo.insert()
    %Friend{user_id: friend_id, friend_id: user.id}
    |> Repo.insert()
  end
end
