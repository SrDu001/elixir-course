defmodule Math do
  @typedoc """
  A division result can be a
  {:ok, result} : where result is a number
  atom          : :infinity, : nan
  {:error, msg} : where msg is a string
  """

  @type division_result :: {atom(), number() | atom() | {:error, String.t()}}

  @spec div(number(), number()) :: division_result()
  def div(a, b) when is_number(a) and is_number(b) do
    try do
      a / b
    rescue
      ArithmeticError ->
        cond do
          b != 0 -> {:error, "Unexpected error"}
          a == 0 -> :nan
          true -> :infinity
        end
    else
      result -> {:ok, result}
    end
  end
end
