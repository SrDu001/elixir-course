defmodule Fibo do
  @spec fibo(integer()) :: integer()
  def fibo(n) when is_integer(n) and n > 0, do: fibop(n, 0, 1)
  defp fibop(1, _, b), do: b
  defp fibop(n, a, b), do: fibop(n- 1, b, a + b)
end

IO.puts Fibo.fibo(1)
IO.puts Fibo.fibo(2)
IO.puts Fibo.fibo(3)
IO.puts Fibo.fibo(4)
IO.puts Fibo.fibo(5)
