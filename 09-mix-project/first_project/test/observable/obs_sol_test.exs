defmodule ObservableSolTest do
  use ExUnit.Case
  doctest ObsSol

  test "Initial state" do
    {:ok, subject} = ObsSol.create()
    assert ObsSol.read(subject) == 0

    {:ok, subject} = ObsSol.create(0)
    assert ObsSol.read(subject) == 0

    {:ok, subject} = ObsSol.create(1)
    assert ObsSol.read(subject) == 1
  end

  test "attach and detach, increment and notify" do
    {:ok, subject} = ObsSol.create()
    ObsSol.increment(subject)
    assert ObsSol.await() == "There was not an answer"

    ObsSol.attach(subject)
    ObsSol.increment(subject)
    assert_receive 2

    ObsSol.detach(subject)
    ObsSol.increment(subject)
    assert ObsSol.await() == "There was not an answer"
  end

  test "attach and detach, decrement and notify" do
    {:ok, subject} = ObsSol.create(5)
    ObsSol.decrement(subject)
    assert ObsSol.await() == "There was not an answer"

    ObsSol.attach(subject)
    ObsSol.decrement(subject)
    assert ObsSol.await() == 3

    ObsSol.detach(subject)
    ObsSol.decrement(subject)
    assert ObsSol.await() == "There was not an answer"
  end
end
