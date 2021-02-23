defmodule SocialNetwork.Repo.Migrations.RemoveFriendRel do
  use Ecto.Migration

  def change do
    alter table(:user_friends) do
      remove :friend_id
      add :friend_id, :integer
    end
  end
end
