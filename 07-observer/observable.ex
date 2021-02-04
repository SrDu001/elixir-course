defmodule Observable do
  @spec create(integer() :: pid())
  def create(initialState \\ 0) do
    spawn(__MODULE__, :listen, [[], initialState])
  end

  defp listen(observers, state) do
    receive do
      {:attach, observer_pid} ->
        # new_observers = add_observers(observers, observer_pid)
        # listen(new_observers)
        observers |> add_observer(observer_pid) |> listen(state)

      {:deatach, observer_pid} ->
        # new_observers = add_observers(observers, observer_pid)
        # listen(new_observers)
        observers |> remove_observer(observer_pid) |> listen(state)

      {:increment} ->
        state = state + 1
        notify(observers, state)
        listen(observers, state)

      {:decrement} ->
        state = state - 1
        notify(observers, state)
        listen(observers, state)

      {:read, reader_pid} ->
        send(reader_pid, state)
        listen(observers, state)
    end
  end

  def add_observer(observers, observer_pid), do: [observer_pid | observers]
  def remove_observer(observers, observer_pid), do: observers -- [observer_pid]

  defp notify(observers, state) do
    # Enum.each(observers, fn(obs_id) -> send(obs_pid, state) end)
    # observers |> Enum.each(fn(obs_id)) -> send(obs_pid, state) end)
    observers |> Enum.each(&send(&1, state))
  end

  def attach(subject), do: send(subject, {:attach, self()})
  def detach(subject), do: send(subject, {:detach, self()})
  def increment(subject), do: send(subject, {:increment, self()})
  def decrement(subject), do: send(subject, {:decrement, self()})

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await(millis \\ 1000) do
    receive do
      count -> count
    after
      millis -> :timeout
    end
  end
end

  # subject = %Observable{pid: subject_pid}
  # subject.attach(pid)
  # subject.attach()
  # subject.detach(pid)
  # subject.detach()
  # subject.read()
  # subject.await()
  # subject.increment()
  # subject.decrement()
