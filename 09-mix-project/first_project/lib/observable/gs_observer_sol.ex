defmodule ObsSol do
  use GenServer

  @enforce_keys :value
  defstruct [:value, observers: []]

  def create(initial_value \\ 0) do
    state = %ObsSol{value: initial_value}
    GenServer.start_link(__MODULE__, state)

  end

  def init(value), do: {:ok, value}

  defp add_observer(observers, observer_pid), do: [observer_pid | observers]
  defp remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  defp notify(state), do: state.observers |> Enum.each(&send(&1, state.value))

  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  # def detach(subject), do: GenServer.cast(subject, {:detach, self()})
  def detach(subject), do: GenServer.call(subject, :detach)

  def read(subject), do: GenServer.call(subject, :read)

  def handle_call(:read, _reader_id, state), do: {:reply, state.value, state}

  # def handle_cast({:detach, observer_pid}, {observers, value}) do
  #   observers = observers |> remove_observer(observer_pid)
  #   {:noreply, {observers, value}}
  # end

  def handle_call(:detach, {observer_pid, _}, state) do
    new_observers = state.observers |> remove_observer(observer_pid)
   {:reply, :ok, Map.put(state, :observers, new_observers)}
  end

  def handle_cast({:attach, observer_pid}, state) do
    new_observers = state.observers |> add_observer(observer_pid)
    {:noreply, Map.put(state, :observers, new_observers)}
  end

  ## Extending
  def handle_cast(:increment, state) do
    state = Map.put(state, :value, state.value + 1)
    notify(state)
    {:noreply, state}
  end

  def handle_cast(:decrement, state) do
    state = Map.put(state, :value, state.value - 1)
    notify(state)
    {:noreply, state}
  end

  def increment(subject), do: GenServer.cast(subject, :increment)
  def decrement(subject), do: GenServer.cast(subject, :decrement)

  def await(timeout \\ 1000) do
    receive do
      count -> count
    after
      timeout -> "There was not an answer"
    end
  end
end

{:ok, subject} = ObsSol.create()
ObsSol.read(subject) |> IO.puts()
ObsSol.attach(subject)
ObsSol.read(subject) |> IO.puts()
ObsSol.increment(subject)
ObsSol.await() |> IO.puts()
ObsSol.increment(subject)
ObsSol.await() |> IO.puts()
ObsSol.decrement(subject)
ObsSol.await() |> IO.puts()
ObsSol.detach(subject)
ObsSol.increment(subject)
ObsSol.await() |> IO.puts()
IO.puts("The counter is #{ObsSol.read(subject)}")
