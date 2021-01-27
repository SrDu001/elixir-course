defmodule SimpleFactorial do
  def fac(n) do
    cond do
      n > 1 -> n * fac(n - 1)
      n >= 0 -> 1
      true -> -1
    end
  end
end

IO.puts SimpleFactorial.fac(5)
