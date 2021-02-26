defmodule Balance.Command do
  def run(command) do
    case command do
      :read -> {:ok, "#{Balance.read(:bal)}\r\n"}
      {:deposit, value} -> {:ok, "#{Balance.deposit(:bal, value)}\r\n"}
      {:withdraw, value} -> {:ok, "#{Balance.withdraw(:bal, value)}\r\n"}
      _ -> {:error, :unknown_command}
    end
  end

  def parse(message) when is_binary(message) do
    action = message |> String.split(" ") |> Enum.at(0)
    cant = message |> String.split(" ") |> Enum.at(1)

    try do
      case action do
        "read\r\n" -> {:ok, :read}
        "deposit" -> {:ok, {:deposit, Regex.replace(~r/\r\n/u, cant, "") |> String.to_integer}}
        "withdraw" -> {:ok, {:withdraw, Regex.replace(~r/\r\n/u, cant, "") |> String.to_integer}}
        _ -> {:error, :unknown_command}
      end
    rescue
      ArgumentError -> {:error, :ilegal_expression}
      #FunctionClauseError -> {:error, :ilegal_expression}
    end
  end
end
