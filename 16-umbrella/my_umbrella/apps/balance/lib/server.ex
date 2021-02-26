defmodule Balance.Server do
  require Logger

  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Balance.Supervisor.start_link([])
    Logger.info("Aceptando conexiones en el puerto #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    Task.start_link(fn -> serve(client) end)
    loop_acceptor(socket)
  end

  defp serve(socket) do
    msg = case read_line(socket) do
      {:ok, data} ->
        Logger.info("Mensaje: #{data}")
        case Balance.Command.parse(data) do
          {:ok, action} -> Balance.Command.run(action)
          {:error, _} = err -> err
        end
      {:error, _} = err -> err
    end
    write_line(msg, socket)
    serve(socket)
  end

  defp read_line(socket) do
    :gen_tcp.recv(socket, 0)
    #{:ok, data} = :gen_tcp.recv(socket, 0)
    #Logger.info("Se recibio: #{data}")
    #data
  end

  defp write_line({:ok, line}, socket) do
    :gen_tcp.send(socket, "Your current balance is: #{line}")
  end

  defp write_line({:error, :close}, _socket) do
    exit(:shutdown)
  end

  defp write_line({:error, :unknown_command}, socket) do
    :gen_tcp.send(socket, "UNKNOWN COMMAND\r\n")
  end

  defp write_line({:error, :ilegal_expression}, socket) do
    :gen_tcp.send(socket, "ILEGAL EXPRESSION\r\n")
  end

  defp write_line({:error, err}, socket) do
    :gen_tcp.send(socket, "ERROR\r\n")
    exit(err)
  end
end
