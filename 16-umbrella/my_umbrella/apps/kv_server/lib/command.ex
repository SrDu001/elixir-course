defmodule KVServer.Command do
  def run(_command) do
    {:ok, "OK\r\n"}
  end

  def parse(message) do
    case message do
      "boom\r\n" -> {:error, :unknown_command}
      _ -> {:ok, message}
    end
  end
end
