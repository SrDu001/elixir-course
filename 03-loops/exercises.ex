# Exercises

# 1. f(n) = 1 + 2 + ... + n
# 2. For all n > 0,
#     fibo(n) =
#     | fibo(n - 1) + fibo(n - 2), n > 2
#     | 1, n = 1 or n = 2
# 3. f(a, b)
#     | a == 0 or b == b ->   f(a - 1, b - 1) + 2 * a - 1
#     | a == b ->   f(a - 1, b - 1) + 2 * a - 1
#     | a > b -> f(a - b, b) + f(b, b)
#     | a < b -> f(a, a) + f(b - a, a)
# 4. mcd or gcd (Greatest Common Divison)
#     gcd(a, b) =
#     | b == 0 -> a
#     | b > a -> gcd(b,a)
#     | else -> gcd(a - b, b)
# 5. Write a function that recieve a positive integer
# and prints the following
# ´´´
# 1
# 01
# . ----
# .
# . ......1 #n lines
# ´´´

defmodule Binary do
  def bin(n) when n > 0  do
    IO.puts("Hola" + "a")
  end


end

defmodule Fibonacci do
  def fibo(n) when n < 2  do
    n
  end

  def fibo(n) do
   fibo(n - 1) + fibo(n - 2)
  end
end

defmodule ConSum do
  def consum(n) when n > 0 do
    consump(0, 0, n)
  end

  defp consump(c, s, n) do
    s = s + 1
    c = c + s
    cond do
      s == n ->
        IO.puts(c)
      true ->
        consump(c, s, n)
    end
  end
end

ConSum.consum(2)
IO.puts(Fibonacci.fibo(11))
Binary.bin(1)
