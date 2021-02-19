defmodule Books.Author do
  use Ecto.Schema

  schema "authors" do
    field :name, :string
    has_many :books, Books.Book
  end
end
