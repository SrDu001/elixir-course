defmodule SocialNetwork.Repo.Migrations.AddPostsDate do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :date, :date
    end
  end
end
