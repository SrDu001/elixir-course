defmodule Books.Distributor do
  use Ecto.Schema

  schema "distributors" do
    field :name, :string
  end
end
