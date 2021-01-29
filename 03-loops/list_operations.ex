defmodule ListOperations do
  def sum(list) when is_list(list), do: sump(0, 0, list)

  defp sump(n, sum, list) do
    if n < length(list), do: sump(n + 1, sum + Enum.at(list, n), list), else: sum
  end

  def reverse(list) when is_list(list), do: reversep(list, length(list) - 1, [])

  defp reversep(list, n, reversedList) do
    if n >= 0 do
      reversedList = reversedList ++ [Enum.at(list, n)]
      reversep(list, n - 1, reversedList)
    else
      reversedList
    end
  end

  def is_ascendant?(list) when is_list(list), do: is_ascendantp(Enum.at(list, 0), Enum.at(list, 1), list, 1)

  defp is_ascendantp(p, n, list, c) do
    cond do
      p < n ->
        is_ascendantp(n, Enum.at(list, c + 1), list, c + 1)
      p > n ->
        false
      true -> true
    end
  end
end

IO.puts ListOperations.sum([1, 2, 3, 8, 9])
IO.inspect ListOperations.reverse([])
IO.inspect ListOperations.reverse([1, 2, 3, 6, 9])
IO.inspect ListOperations.is_ascendant?([6, 1])
IO.puts ListOperations.is_ascendant?([1, 2, 3, 4, 8])
IO.puts ListOperations.is_ascendant?([8, 1, 3, 4, 5])
IO.puts ListOperations.is_ascendant?([])
IO.puts ListOperations.is_ascendant?([89])
