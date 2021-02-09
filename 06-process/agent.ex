{:ok, pid} ? Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, "World") end)
Agent.get(pid, fn )
DD

##
{:ok, agent} = Agent.start_lin fn -> 123  end
IO.puts Agent.get_and_update(agent, fn state -> {state - 5, state + 1} end) # 118
IO.puts Agent.get(agent, fn x -> x end) # 124
