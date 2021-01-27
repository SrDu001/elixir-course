defmodule Loop do
  #  int i = 0;
  #  while(true) {
  #    unless(i < n) break;
  #    println(value);
  #    i++;
  #  }
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i + 1, n, value)

      true ->
        :ok
    end
  end

  def for_loop1(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    for_loop1(i+ 1 , n, value)
  end

  def for_loop1(_, _, _), do: :ok

  # int = 0;
  # while(true) {
  #   println(value);
  #   i++;
  #   if (i ==n) {
  #     break
  #   }
  # }

  def do_while1(i, n, value) when i < n do
    IO.puts("#{value} #{i}")
    do_while1(i + 1, n, value)
  end

  def do_while1(i, n, value) do
    :ok
  end


end

Loop.do_while1(0,3, "")
