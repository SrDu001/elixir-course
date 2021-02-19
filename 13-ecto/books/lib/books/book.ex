defmodule Books.Book do
  use Ecto.Schema

  schema "books" do
    field :name, :string
    belongs_to :author, Books.Author
  end

  def changeset(book, params \\ %{}) do
    book
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
