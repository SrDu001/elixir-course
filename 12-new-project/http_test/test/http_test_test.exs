defmodule HttpTestTest do
  use ExUnit.Case
  doctest HttpTest

  test "greets the world" do
    assert HttpTest.hello() == :world
  end
end
