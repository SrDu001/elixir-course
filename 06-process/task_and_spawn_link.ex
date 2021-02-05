## Similar to spawn but libked with its parent
pid = spawn_link fn -> 1 + 2 end
IO.inspect pid

pid1 = spawn fn -> raise "Oops! There's an error" end
# pid2 = spawn_link fn -> raise "Oops! There's an error" end
IO.inspect pid1
# IO.inspect pid2

## Task

# Based on spawn
{:ok, pid} = Task.start fn -> 1 + 2 end
Io.inspect pid # #PID<0.101.0>
# TODO: raise an error inside the Task.start
# Task.start_link fn -> raise "Opps!" end

# Based on spawn_link
{:ok, pid} = Task.start_link fn -> 1 + 2 end
Io.inspect pid # #PID<0.101.0>
# TODO: raise an error inside the Task.start
# Task.start_link fn -> raise "Opps!" end
