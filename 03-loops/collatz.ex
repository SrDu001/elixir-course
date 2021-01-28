defmodule Collatz do
  def coll(n) when is_integer(n) and n > 0 do
    cond do
      rem(n, 2) == 0 -> collp2(n)
      n == 1 -> IO.puts("Fin 1")
      true -> collp1(n)
    end
  end

  defp collp1(n) when is_integer(n) do
    IO.puts("Impar #{n}")
    collp2((n * 3) + 1)
  end

  defp collp2(n) when is_integer(n) do
    IO.puts("Par #{n}")
    n = div(n, 2)
    cond do
      rem(n, 2) == 0 -> collp2(n)
      n == 1 -> IO.puts("Fin #{n}")
      true -> collp1(n)
    end
  end
end

Collatz.coll(578)
