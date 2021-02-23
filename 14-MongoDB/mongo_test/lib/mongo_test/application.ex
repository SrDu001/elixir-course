defmodule MongoTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Mongo, [[name: :mongo, database: "admin", pool_size: 2]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MongoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
