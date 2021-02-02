# 1) crean una función recursiva que reciba un array y entregue la suma acumulada hasta su respectivo índice :
#
# Ejemplo 1:
# Input: [1, 3, 4, -1]
# Output: [1, 4, 8, 7]
# Notar que es resultado de
# [1, 1+3, 1+3+4, 1+3+4 + -1]
# 2) Implementar la función anterior usando la función reduce que implementamos en clase
# 3) Implementar un función que reciba una lista de números y retorne true si la lista está vacía u ordenada en orden descendente, caso contrario que retorne falso
# 4) Implementar la función anterior usando la función reduce que usamos en clase
# 5) según lo visto en clase, es viable implementar las funciones de Fibonacci y factorial con las funciones map o reduce? Sustente su respuesta

defmodule Exam do
  def sumList(list) when is_list(list), do: sumListp(list)
  defp sumListp([_ | t], resultList, sum) when length(t) > 0, do: sumListp(t, resultList ++ [sum], Enum.at(t, 0) + sum)
  defp sumListp(_, resultList, sum), do: resultList ++ [sum]
  defp sumListp([h | t]), do: sumListp(t, [h], Enum.at(t, 0) + h)

  def descendant?(list \\ []) when is_list(list), do: descendant_p?(nil, list)
  defp descendant_p?(_, []), do: true
  defp descendant_p?(nil, [b | tail]), do: descendant_p?(b, tail)
  defp descendant_p?(a, [b | tail]) when a >= b, do: descendant_p?(b, tail)
  defp descendant_p?(_, _), do: false

  def sumListRed(list) when is_list(list), do: map(list, &(&1 + &2))

  defp map(list, transform) when is_list(list) and is_function(transform, 2) do
    reduce(list, [0], fn t, acc -> acc ++ [transform.(List.last(acc), t)] end)
  end

  def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
    reducep(list, acc,action)
  end

  defp reducep([] , acc, _), do: acc
  defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)


  def descendantRed?(list \\ []) when is_list(list), do: mapdes(list, &(&1 >= &2))

  defp mapdes(list, transform) when is_list(list) and is_function(transform, 2) do
    reduce2(list, fn h, t -> [{:a, h}, {:b, Enum.at(tl(t), 0)}] end, fn [h | t], acc -> transform.(acc.(h, t)) end)
  end

  def reduce2(list, acc, action) when is_list(list) and is_function(action, 2) and is_function(acc, 2) do
    reducep2(list, acc,action)
  end

  defp reducep2([] , acc, _), do: acc
  defp reducep2([h | t], acc, action), do: reducep2(t, action.(t, acc), action)

end

IO.inspect(Exam.sumListRed([1, 3, 4, -1]))
IO.inspect(Exam.sumList([1, 3, 4, -1]))
IO.inspect(Exam.descendant?([5, 4, 3, 2]))
IO.inspect(Exam.descendant?([5, 4, 3, 6]))
IO.inspect(Exam.descendantRed?([5, 4, 3, 2]))
