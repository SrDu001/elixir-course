defmodule SocialNetworkServerWeb.Api.V1.UserController do
  use SocialNetworkServerWeb, :controller

  alias SocialNetworkServer.User
  alias SocialNetworkServerWeb.Router.Helpers, as: Routes

  def create(conn, _params) do
    %{"name" => name, "nick_name" => nick_name, "email" => email, "password" => password} = conn.body_params
    {:ok, user} = User.create_user(name, nick_name, email, password)
    json(conn, %{
      id: user.id,
      name: user.name,
      user_name: user.name,
      email: email
    })
  end

  def show(conn, %{"id" => userid}) do
    user = User.get_user(userid)

    json(conn, %{
      id: user.id,
      name: user.name,
      user_name: user.name,
      email: user.email,
      password: user.password
    })
  end
end
