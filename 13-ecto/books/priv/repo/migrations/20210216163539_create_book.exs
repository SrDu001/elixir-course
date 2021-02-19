defmodule Books.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
    end

    create table(:books) do
      add :name, :string
      add :author_id, references(:authors), null: false
    end

    create table(:movies) do
      add :title, :string
      add :tagline, :string
    end

    create table(:characters) do
      add :name, :string
      add :movie_id, references(:movies)
    end

    create table(:distributors) do
      add :name, :string
      add :movie_id, references(:movies)
    end

    create unique_index(:distributors, [:movie_id])

    create table(:actors) do
      add :name, :string
    end

    create table(:movies_actors) do
      add :movie_id, references(:movies)
      add :actor_id, references(:actors)
    end

    create unique_index(:movies_actors, [:movie_id, :actor_id])

    create table(:weather) do
      add :city, :string
      add :temp_lo, :integer
      add :temp_hi, :integer
      add :prcp, :float, default: 0.0
    end
  end
end
