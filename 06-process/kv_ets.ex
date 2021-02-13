defmodule KV do

  @vsn 3

  @initial_state {:hello, "World"}

  def start_link do
    table = :ets.new(:bucket, [:set, :public])
    :ets.insert(table, @initial_state)
    table
  end

  def read(ref, key) do
    case :ets.lookup(ref, key) do
      [] -> nil
      [{_, value}] -> value
    end
  end

  def update(ref, key, value), do: :ets.insert(ref, {key, value})
  def insert(ref, key, value), do: update(ref, key, value)
end

kv = KV.start_link()
IO.inspect kv

value = KV.read(kv, :hello)
IO.inspect value # "World"

KV.update(kv, :hello, "Duban Andres")

value = KV.read(kv, :hello)
IO.puts value # "Duban Andres"

kv = KV.insert(kv, :byex, "adios")

value = KV.read(kv, :byex)
IO.inspect value # "adios"

#value = KV.read(kv, :byes)
#IO.inspect value # nil


