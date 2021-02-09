defmodule GsObserver do
  use GenServer

  def create(initialValue \\ 0), do: GenServer.start_link(__MODULE__, {[], initialValue})

  def init(value), do: {:ok, value}

  defp add_observer(observers, observer_pid), do: [observer_pid | observers]
  defp remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  def read(subject), do: GenServer.call(subject, :read)
  def attach(subject), do: GenServer.cast(subject, {:attach, self()})
  def detach(subject), do: GenServer.cast(subject, {:detach, self()})
  def increment(subject, amount), do: GenServer.cast(subject, {:increment, amount})
  def decrement(subject, amount), do: GenServer.cast(subject, {:decrement, amount})

  def handle_cast({:attach, observer_pid}, {observers, value}) do
    observers = observers |> add_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:detach, observer_pid}, {observers, value}) do
    observers = observers |> remove_observer(observer_pid)
    {:noreply, {observers, value}}
  end

  def handle_cast({:increment, amount}, {observers, value}) do
    value = value + amount
    observers |> notify(value)
    {:noreply, {observers, value}}
  end

  def handle_cast({:decrement, amount}, {observers, value}) do
    value = value - amount
    observers |> notify(value)
    {:noreply, {observers, value}}
  end

  def handle_call(:read, _from_id, {observers, value}) do
    {:reply, value, {observers, value}}
  end

  defp notify(observers, value) do
    observers |> Enum.each(&send(&1, value))
  end

  def await(millis \\ 1000) do
    receive do
      count -> count
    after
      millis -> :timeout
    end
  end
end
