defmodule Books.Repo.Migrations.FixingDistributorsForeignKey do
  use Ecto.Migration

  def change do
    alter table(:distributors) do
      remove :movie_id
    end
    alter table(:movies) do
      add :distributor_id, references(:distributors)
    end
  end
end
