defmodule Factorial do
  def classic(n) when is_integer(n) and n >= 0 do
    cond do
      n < 2 -> 1
      true -> facp1(n, 0, 1)
    end
  end

  def fac1(n) when is_integer(n) and n >= 0 do
    facp1(n, 0, 1)
  end

  # acc = 1
  # for(int i = 0; i<n; i++){
  #   acc *= (i + 1); // acc = acc * (i + 1)
  # }
  # return acc;
  cond do
    i == n -> acc
    true -> facp1(n, i + 1, acc * (i + 1))
  end
end
