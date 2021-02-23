defmodule SocialNetwork.Repo.Migrations.CreateSocialNetwork do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nick_name, :string
      add :name, :string
      add :password, :string
      add :email, :string
    end

    create table(:posts) do
      add :content, :string
      add :user_id, references(:users)
    end

    create table(:user_friends) do
      add :user_id, references(:users)
      add :friend_id, references(:users)
    end

    create unique_index(:user_friends, [:user_id, :friend_id])
  end
end
