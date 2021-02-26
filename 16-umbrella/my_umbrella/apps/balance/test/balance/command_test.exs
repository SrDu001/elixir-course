defmodule BalanceTest.Command do
  use ExUnit.Case
  doctest Balance

  test "test error on running" do
    assert Balance.Command.run(:other) == {:error, :unknown_command}
    assert Balance.Command.run([]) == {:error, :unknown_command}
    assert Balance.Command.run("hello") == {:error, :unknown_command}
  end

  test "test error on parsing" do
    assert Balance.Command.parse("deposit '89'") == {:error, :ilegal_expression}
    assert Balance.Command.parse("deposit asd") == {:error, :ilegal_expression}
    assert Balance.Command.parse("withdraw asd") == {:error, :ilegal_expression}
    assert Balance.Command.parse("anything else") == {:error, :unknown_command}
    assert_raise FunctionClauseError, fn -> Balance.Command.parse(:other) end
    assert_raise FunctionClauseError, fn -> Balance.Command.parse([]) end
  end

  test "test running commands" do
    assert Balance.Command.run(:read) == {:ok, "0\r\n"}
    assert Balance.Command.run({:deposit, 10}) == {:ok, "10\r\n"}
    assert Balance.Command.run(:read) == {:ok, "10\r\n"}
    assert Balance.Command.run({:withdraw, 5}) == {:ok, "5\r\n"}
    assert Balance.Command.run({:withdraw, 5}) == {:ok, "0\r\n"}
    assert Balance.Command.run({:deposit, 100}) == {:ok, "100\r\n"}
    assert Balance.Command.run(:read) == {:ok, "100\r\n"}
    assert Balance.Command.run({:withdraw, 100}) == {:ok, "0\r\n"}
  end

  test "test parsing messages" do
    assert Balance.Command.parse("read\r\n") == {:ok, :read}
    assert Balance.Command.parse("deposit 4") == {:ok, {:deposit, 4}}
    assert Balance.Command.parse("withdraw 4") == {:ok, {:withdraw, 4}}
  end
end
