defmodule Bye do
  def bye(processName)  do
    Node.spawn_link(processName, fn ->
      receive do
        {:hi, client} -> send(client, :bye)
      end
     end)
  end
end
