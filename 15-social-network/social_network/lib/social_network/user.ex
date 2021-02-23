defmodule SocialNetwork.User do
  use Ecto.Schema

  schema "users" do
    field :nick_name, :string
    field :name, :string
    field :password, :string
    field :email, :string
    has_many :posts, SocialNetwork.Post
    # many_to_many :friends, SocialNetwork.User, join_through: "user_friends"
  end
  alias SocialNetwork.{Repo, User}

  def add_user(name, nick_name, password, email) do
    %User{name: name, nick_name: nick_name, password: password, email: email}
    |> Repo.insert()
  end
end
