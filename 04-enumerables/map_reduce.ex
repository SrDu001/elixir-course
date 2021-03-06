defmodule MyMapReduce do
  def double(list) when is_list(list), do: map(list, &(2 * &1))
  def sum(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

  defp map(list, transform) when is_list(list) and is_function(transform, 1) do
    # mapp(list, [], transform)
    reduce(list, [], fn h, acc -> acc ++ [transform.(h)] end)
  end

  # defp mapp([], acc, _), do: acc
  # defp mapp([h | t], acc, transform), do: mapp(t, acc ++ [transform.(h)], transform)

  def filter(list, condition?) when is_function(condition?, 1) do
    # filterp(list, condition, [])
    # reduce(list, [], fn h, acc -> if.condition?.(h), do: acc ++ [h], else: acc end)
    reduce(list, [], &(if condition?.(&1), do: &2 ++ [&1], else: &2))
  end

  defp filterp([] , _, result), do: result
  defp filterp([h | t],condition, result) do
    newResult = if condition.(h), do: result ++ [h], else: result
    filterp(t, condition, newResult)
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc,action)
  end

  defp reducep([] , acc, _), do: acc
  defp reducep( [h | t], acc, action), do: reducep(t, action.(h, acc), action)

end

# iex.bat .\map_reduce.ex
# iex(1)> MyMapReduce.double([])
# []
# iex(2)> MyMapReduce.double([1])
# [2]
# iex(3)> MyMapReduce.double([1, 2])
# [2, 4]
# iex(4)> MyMapReduce.double([1, 3, 2])
# [2, 6, 4]
IO.inspect MyMapReduce.double([1, 2])
IO.puts MyMapReduce.sum([1, 2])
IO.inspect MyMapReduce.filter([1, 2, 4, 5, 6, 7],&(rem(&1, 2) == 0))
