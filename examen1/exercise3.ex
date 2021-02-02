defmodule Excercise3 do
  def descendant?(list \\ []) when is_list(list), do: is_descendant_p?(nil, list)

  defp is_descendant_p?(_, []), do: true
  defp is_descendant_p?(nil, [h | tail]), do: is_descendant_p?(h, tail)
  defp is_descendant_p?(aux, [h | tail]) when aux >= h, do: is_descendant_p?(h, tail)
  defp is_descendant_p?(_, _), do: false
end

IO.inspect Excercise3.descendant?([]) # false
IO.inspect Excercise3.descendant?([1]) # false
IO.inspect Excercise3.descendant?([1, 2]) # true
IO.inspect Excercise3.descendant?([1, 2, 3]) # true
IO.inspect Excercise3.descendant?([1, 2, 3, 4]) # true
IO.inspect Excercise3.descendant?([1, 2, 3, 4, 5]) # true
IO.inspect Excercise3.descendant?([7, 4, 2]) # true
IO.inspect Excercise3.descendant?([7, 4, 2, 1]) # true
IO.inspect Excercise3.descendant?([9, 8, 7, 4, 2]) # true
