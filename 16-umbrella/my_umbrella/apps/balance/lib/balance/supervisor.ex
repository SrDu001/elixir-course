defmodule Balance.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      #GsObserver # With Process ID
      #{Balance, name: Balance}, # With Pseudonym
      {Balance, name: :bal} # With Pseudonym :atom
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
