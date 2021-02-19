defmodule Books do
  @moduledoc """
  Documentation for `Books`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Books.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule Books.App do
  import Ecto.Query
  alias Books.{Weather, Repo}

  def keyword_query do
    query =
      from w in Weather,
           where: w.prcp > 0.0 or is_nil(w.prcp),
           select: w

    Repo.all(query)
  end

  def pipe_query do
    Weather
    |> where(city: "Kraków")
    |> order_by(:temp_lo)
    |> limit(10)
    |> Repo.all
  end
end
