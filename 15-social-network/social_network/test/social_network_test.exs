defmodule SocialNetworkTest do
  use ExUnit.Case
  doctest SocialNetwork

  test "greets the world" do
    assert SocialNetwork.hello() == :world
  end
end
