defmodule SocialNetworkServer.Friend do
  use Ecto.Schema

  schema "user_friends" do
    field :user_id, :integer
    field :friend_id, :integer
  end

  import Ecto.Query
  alias SocialNetworkServer.{Repo, Friend, User}

  def add_friend(userid, friend_id) do
    user = Repo.get(User, userid)
    %Friend{user_id: user.id, friend_id: friend_id}
    |> Repo.insert()
    %Friend{user_id: friend_id, friend_id: user.id}
    |> Repo.insert()
  end

  def get_user_friends(userid) do
    user = Repo.get(User, userid)
    query =
      from f in Friend,
      where: f.user_id == ^user.id,
      join: u in User, on: u.id == f.friend_id,
      select: {f, u}
    result = Repo.all(query)
    Enum.map(result, fn({f, u})->
      Map.put(f, :friend, u)
    end)
  end
end
