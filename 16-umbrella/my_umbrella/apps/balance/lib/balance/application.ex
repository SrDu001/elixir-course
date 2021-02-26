defmodule Balance.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "8000")
    children = [
      # Starts a worker by calling: Balance.Worker.start_link(arg)
      # {Balance.Worker, arg}
      {Task.Supervisor, name: Balance.TaskSupervisor},
      {Task, fn -> (Balance.Server.accept(port)) end}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Balance.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
