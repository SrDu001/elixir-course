defmodule SocialNetwork do
  @moduledoc """
  Documentation for `SocialNetwork`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SocialNetwork.hello()
      :world

  """
  def hello do
    :world
  end
end

# alias SocialNetwork.{User, Post}
# camel = %User{name: "Camel Negrete", nick_name: "camel", password: "123456", email: "cnegrete@gmail.com"}
# du001 = %User{name: "Duban Andres", nick_name: "SrDu001", password: "123456", email: "srdu001@gmail.com"}
# User.add_user("Javier Murcia", "jamurcia", "123456", "jamurciaj@gmail.com")
# Post.create_post(javier, "post de Javier 1")
# SocialNetwork.Repo.insert(camel)
# du001 = SocialNetwork.Repo.get(SocialNetwork.User, 1)
# camel = SocialNetwork.Repo.get(SocialNetwork.User, 2)
#
# du001 = SocialNetwork.Repo.preload(du001, [:friends, :posts])
# camel = SocialNetwork.Repo.preload(camel, [:friends, :posts])
# du001_changeset = Ecto.Changeset.change(du001)
# du001_friends_changeset = du001_changeset |> Ecto.Changeset.put_assoc(:friends, [camel])
# SocialNetwork.Repo.update!(du001_friends_changeset)


# datetime} = DateTime.now("Etc/UTC")
