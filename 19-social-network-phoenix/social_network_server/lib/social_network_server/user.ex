defmodule SocialNetworkServer.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :nick_name, :string
    field :password, :string
    field :email, :string
    has_many :posts, SocialNetworkServer.Post
  end
  alias SocialNetworkServer.{Repo, User}

  def create_user(name, nick_name, password, email) do
    %User{name: name, nick_name: nick_name, password: password, email: email}
    |> Repo.insert()
  end

  def get_user(userid) do
    Repo.get(User, userid)
  end
end
