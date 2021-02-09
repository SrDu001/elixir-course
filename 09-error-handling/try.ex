IO.puts("SECTION 1 ----------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("There division was not posible")
end

IO.puts("SECTION 2 ----------------")

try do
  :bar / 2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  e in ArithmeticError -> IO.puts("There division was not posible: #{e.message}")
end

IO.puts("SECTION 3 ----------------")

try do
  raise CustomError, message: "My custom error"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end

try do
  raise CustomError, message: "My custom error", country: "Colombia"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country: #{e.country}")
end

IO.puts("SECTION 4 ----------------")

try do
  IO.puts("This is not an error")
rescue
  _ -> IO.puts("this is never printed")
after
  IO.puts("This is always printed?")
end

try do
  raise "There was an error :'("
rescue
  _ -> IO.puts("this is printed on error")
after
 IO.puts("This is always printed?")
end

IO.puts("SECTION 5 ----------------")

try do
  IO.puts("This is not an error")
catch
  e -> IO.puts("this is never printed #{e}")
after
  IO.puts("This is always printed")
end

try do
  throw(453_637)
  IO.puts("This is not an error")
catch
  e -> IO.puts("this is a catch: #{e}")
after
  IO.puts("This is always printed")
end

IO.puts("SECTION 6 ----------------")

try do
  throw("hola")
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed")
end

IO.puts("SECTION 7 ----------------")

try do
  throw(nil)
  IO.puts("This is not an error")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is always printed")
end

IO.puts("SECTION 8 ----------------")

try do
  0..20
  |> Enum.each(fn x ->
    if x == 10, do: raise("Oops! x == 10")
  end)
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
# after
  IO.puts("This is always printed?")
end

sum = try do
  1..20 |> Enum.reduce(0, fn h, acc ->
    if rem(h, 13) == 0 do
      # raise acc
      throw acc
    else
      h + acc
    end
  end)
#rescue
  # e in RuntimeError -> e.message # No es una intencion valida, lo ideal es el throw catch
catch
  acc -> acc
end

IO.puts sum


####
how_large_is = fn x ->
  try do
    1 / x
  rescue
    ArithmeticError -> :infinity
  catch
    e -> IO.puts e
  else
    d when d < 1 and d > -1 -> :small
    d when d < 10 and d > -10 -> :middle
    _ -> :large
  after
    IO.puts "Hello"
  end
end

how_large_is.(0) # Hello :infinity
how_large_is.(1) # Hello :middle
how_large_is.(2) # Hello :small
how_large_is.(0.5) # Hello :middle
how_large_is.(0.1) # Hello :large
