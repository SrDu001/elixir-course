defmodule Books.Movie do
  use Ecto.Schema

  schema "movies" do
    field :title, :string
    field :tagline, :string
    has_many :characters, Books.Character
    has_one :distributor, Books.Distributor
    many_to_many :actors, Books.Actor, join_through: "movies_actors"
  end
end
