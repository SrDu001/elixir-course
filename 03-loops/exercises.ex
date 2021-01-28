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


defmodule SomeFunction do
  def thrd(a, b) when a == 0 or b == b do
    thrd(a - 1, b - 1) + 2 * a - 1
  end

  def thrd(a, b) when a == b do
    thrd(a - 1, b - 1) + 2 * a - 1
  end

  def thrd(a, b) when a > b do
    thrd(a, a) + thrd(b - a, a)
  end

  def thrd(a, b) when a < b do
    thrd(a, a) + thrd(b - a, a)
  end
end


defmodule Pyramid do
  def pir(n) do
    pirp(0, n, "")
  end

  defp pirp(c, n, s) when c <= n do
    cond do
      c == n ->
        IO.puts("end")

      rem(String.length(s), 2) == 0 ->
        add(c, n, "1#{s}")

      true ->
        add(c, n, "0#{s}")
    end
  end

  defp add(c, n, res) do
    IO.puts(res)
    pirp(c + 1, n, res)
  end
end

defmodule Fibonacci do
  def fibo(n) when n < 2 do
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

# ConSum.consum(2)
# IO.puts(Fibonacci.fibo(11))
# Pyramid.pir(5)
IO.puts(SomeFunction.thrd(5,5))
