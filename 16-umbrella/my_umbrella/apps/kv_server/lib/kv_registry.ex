defmodule KV.Registry do
  @moduledoc """
  Provides a key-Value (KY) process to access a shared state map based on Agent

  ## Examples

      iex> KV.star_link()
      {:ok, #PID<0.101.0>}
      iex> KV.read(kv, :hello)
      nil
      iex> KV.update(kv, :hello, "World")
      :ok
      iex> KV.read(kv, :hello)
      "World"
  """

  @vsn 2

  @initial_state %{hello: "World"}

  @doc """
  Creates a pid to read and create/update a key-value pair

  ## Example
      iex> {:ok, kv} = KV.start_link()
      {ok: #PID<0.101.0>}
  """
  def start_link do
    Agent.start_link(fn -> @initial_state end)
  end

  @doc """
  Reads a value for a key. If the key does not exist, returns nil

  ## Example

      iex> KV.read(kv, :hello)
      nil
  """
  def read(kv_pid, key) do
    Agent.get(kv_pid, fn map -> Map.get(map, key) end)
  end

  @doc """
  Updates or creates (if necessary) a value for a key.

  ## Example

      iex> KV.update(kv, :hello, "World")
      :ok
  """
  def update(kv_pid, key, value)  do
    Agent.update(kv_pid, fn map -> Map.put(map, key, value) end)
  end
end
