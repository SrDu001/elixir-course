defmodule SocialNetworkServer.Post do
  use Ecto.Schema

  schema "posts" do
    field :date, :date
    field :content, :string
    belongs_to :user, SocialNetworkServer.User
  end

  import Ecto.Query
  alias SocialNetworkServer.{Repo, Friend, Post, User}

  def create_post(userid, content) do
    user = Repo.get(User, userid)
    Ecto.build_assoc(user, :posts, %{content: content, date: Date.utc_today()})
    |> Repo.insert!()
  end

  def get_friends_posts(userid, offset \\ 0, limit \\ 10) do
    user = Repo.get(User, userid)
    query =
      from f in Friend,
      where: f.user_id == ^user.id,
      join: p in Post, on: p.user_id == f.friend_id,
      select: p,
      order_by: [desc: p.id],
      offset: ^offset,
      limit: ^limit
    Repo.all(query)
#   Weather
#   |> where(city: "Kraków")
#   |> order_by(:temp_lo)
#   |>
#   |> Repo.all

  end
end
