defmodule ListOperations do
  def sum(array) when is_list(array), do: sump(0, 0, array)

  defp sump(n, sum, array) do
    if n < length(array), do: sump(n + 1, sum + Enum.at(array, n), array), else: IO.puts(sum)
  end

  def reverse(array) when is_list(array), do: reversep(array, length(array) - 1, [])

  defp reversep(array, n, reversedArray) do
    if n >= 0 do
      reversedArray = reversedArray ++ [Enum.at(array, n)]
      reversep(array, n - 1, reversedArray)
    else
      IO.inspect(reversedArray)
    end
  end

  def is_ascendant(array) when is_list(array), do: is_ascendantp(Enum.at(array, 0), Enum.at(array, 1))

  defp is_ascendantp(p, n) do
    cond do
      p < n -> true
      p > n -> false
      true -> false
    end
  end
end

ListOperations.sum([1, 2, 3, 8, 9])
ListOperations.reverse([1, 2, 3, 6, 9])
ListOperations.is_ascendant([1, 2, 3, 6, 9])
# IO.inspect [1, 2, 3, 8, 9]
