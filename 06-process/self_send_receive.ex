await1 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <>
    {:pid, pid} -> pid
  end
end

await2 = fn ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <>
    {:pid, pid} -> pid
    _ -> {:error, "there wasn't a match"}
  end
end

await3 = fn millis ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  after
    millis -> "Timeout after #{millis} milliseconds!"
  end
end

test = fn await ->
  send self(), {:hello, "World"}
  IO.puts await.() # "World"

  send self(), {:bye, "bye"}
  IO.puts await.() # "bye bye"

  send self(), {:hi, "?"}
  IO.inspect await.() # Will
end

#rest.(await1)
# "World"
# "bye bye"
# -------- freezed

IO.puts "----------------"
test.(await2)
# "World"
# "bye bye"
# {:error, "there wasn't a match"}

test.(fn -> await.(1000) end)
# "World"
# "bye bye"
# (After 1000 miliseconds): Timeout!

IO.puts "=============="
spawn fn -> send self(), {:hello, "World"} end
IO.puts await3.(1000) # Timeout

IO.puts "----------------"
self_pid = felf()
pid = spawn fn ->
  endspid = self()
  send self_pid, {:pid, spid}
end
second_pid = await3.(1000) #process id of the spawn
IO.puts pid === second_pid
