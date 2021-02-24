defmodule Balance do
  use GenServer

  def start_link(opts), do: GenServer.start_link(__MODULE__, 0, opts)

  def init(state), do: {:ok, state}

  def read(balance), do: GenServer.call(balance, {:deposit, 0})
  def deposit(balance, amount), do: GenServer.call(balance, {:deposit, amount})
  def withdraw(balance, amount), do: GenServer.call(balance,  {:withdraw, amount})
  def transfer(balance, amount), do: GenServer.cast(balance,  {:transfer, amount})


  def handle_call({:deposit, amount}, _from_id, state) do
    state = state + amount
    {:reply, state, state}
  end

  def handle_call({:withdraw, amount}, _from_id, state) do
    state = state - amount
    raise "Error on withdraw"
    {:reply, state, state}
  end

  def handle_cast({:transfer, amount}, state), do: {:noreply,  state + amount}
end

# Normal

# {:ok, subject} = Balance.create()
# Balance.read(subject) |> IO.puts()
# Balance.deposit(subject, 4) |> IO.puts()
# Balance.read(subject) |> IO.puts()
# Balance.withdraw(subject, 2) |> IO.puts()

# Balance.child_spec(0)  # Check Child specification Returns %{id: Balance, start: {Balance, :start_link, [0]}}

# With Process ID

# {:ok, sup} = Balance.Supervisor.start_link([]) # {:ok, #PID<0.311.0>}
# [{_, balance, _, _}] = Supervisor.which_children(sup) # [{Balance, #PID<0.312.0>, :worker, [Balance]}]
# Balance.read(balance) # 0
# Balance.deposit(balance, 10) # 10
# Balance.read(balance) # 10
# Balance.withdraw(balance, 5) # (RuntimeError) Error on withdraw
# Balance.read(balance) # 0 (Restarted)

# With Pseudonym

# {:ok, sup} = Balance.Supervisor.start_link([]) # {:ok, #PID<0.159.0>}
# Balance.read(Balance) # 0
# Balance.deposit(Balance, 10) # 10
# Balance.read(Balance) # 10
# Balance.withdraw(Balance, 5) # (RuntimeError) Error on withdraw
# Balance.read(Balance) # 0 (Restarted)

# With Pseudonym atom

# {:ok, sup} = Balance.Supervisor.start_link([]) #{:ok, #PID<0.224.0>}
# Balance.read(:bal) # 0
# Balance.deposit(:bal, 10) # 10
# Balance.read(:bal) # 10
# Balance.withdraw(:bal, 5) # (RuntimeError) Error on withdraw
# Balance.read(:bal) # 0 (Restarted)
