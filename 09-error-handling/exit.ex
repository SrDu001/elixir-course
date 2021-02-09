a = spawn_link fn ->
  receive do
    msg -> IO.puts(msg)
  end
end
IO.puts Process.alive?(a) # true

send a, "hello"
IO.puts Process.alive?(a) # false

###

a = spawn_link fn ->
  exit(1)
  receive do
    msg -> IO.puts(msg)
  end
end
Process.alive?(a)
