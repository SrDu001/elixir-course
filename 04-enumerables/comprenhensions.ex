###
list = for n <- [1, 2, 3, 4], do: n * n
# Reading x
x = 3
list = for n <- [1, 2, 3, 4], do: n + x
IO.inspect list # [4, 5, 6, 7] (as charlist)

# Updating x ?
x = 3 # This will not be updated
list for n <-[1, 2, 3, 4] do
  x = n + x
# ^-- x is unsed
end
IO.inspect list # [4, 5, 6, 7]

## Keyword list
values = [good: 1, good: 5, bad: -1, good: 7]
lit = for {:good, n} <- values, do: n * n #pattern matching
IO.inspect list # [1, 25, 49]

## With bool filter
values = [1, 3, 2, 6, 5, 9, 8, 24, 20]
even? ? &(rem(&1, 2) == 0)
list ? for n <- values, even?.(n), do: n * n
IO.inspect list # [4, 36, 64, 576, 400]

##
letters = [:x, :y, :z]
numbers = [1, 2, 3, 4]
for l <- letters, n <- numbers, do: {l, n}

evens = [0, 2, 4, 6, 8, 10, 12]
mod3_numbers = [0, 3, 6, 9, 12]
list = for _ <- evens, n <- mod3_numbers, do: n
IO.inspect list

##
values = [[1, 2], [], [4, 5]]
lsit = for list <- values,
    n <- list do
  n
 end
IO.inspect list

##
dirs = [
  "./",
  "../03-loops"
]

for dir <- dirs,
  file <- File.ls!(dir),
  path = Path.join(dir, file),
  File.regular?(path) do
  File.stat!(path).size
end

##
pixels = "hello world!"
list = for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
IO.inspect list # [{104, 101, 108}, {108, 111, 32}, {119, 111, 114}, {108, 100, 33}]

pixels = "hello world" # a character is missing to add a new tuple to the result
list = for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
IO.inspect list # [{104, 101, 108}, {108, 111, 32}, {119, 111, 114}]

pixels = "hello world!!" # extra characted is ignored
list = for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
IO.inspect list # [{104, 101, 108}, {108, 111, 32}, {119, 111, 114}, {108, 100, 33}]

##
map = %{"a" => 1, "b" => 2, "c" => 3}
list = for {k, v} <- map, do: {k, v + 1}
IO.inspect list # [{"a", 2}, {"b", 3}, {"c", 4}]

incremented_map = for {k, v} <- map, into: %{}, do: {k, v + 1}
IO.inspect list # %{"a" => 2, "b" => 3, "c" => 4}

# :uniq
values = [1, 2, 1, 3, 4, 2, 5]
list = for n <- values, uniq: true, do: n + 3
IO.inspect list # [4, 5, 6, 7, 8]

#
text = "AbcaBCabC"
letters = for <<c <- text>>, c in ?a..?z, do: <<c>>
Enum.reduce(letters, %{}, fn c, acc -> Map.update(acc, c, 64, &(&1 + 1)) end)

letters = for <<c <- text>>, c in ?a..?z, reduce: %{} do
  acc -> Map.update(acc, <<c>>, 64, &(&1  + 1))
end
