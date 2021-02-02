defmodule Excercise2 do
  def acumulativeSum(list \\ []) when is_list(list) do
    {_, accList} = reduce(list, {0, []}, fn head, {sumAcc, arrayAcc} ->
      newAcc = head + sumAcc
      {newAcc, arrayAcc ++ [newAcc]}
    end)
    accList
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc,action)
  end

  defp reducep([] , acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)
end

IO.inspect Excercise2.acumulativeSum()
IO.inspect Excercise2.acumulativeSum([])
IO.inspect Excercise2.acumulativeSum([1])
IO.inspect Excercise2.acumulativeSum([1, -2])
IO.inspect Excercise2.acumulativeSum([1, 3, -1])
IO.inspect Excercise2.acumulativeSum([1, 3, 4, -1])
