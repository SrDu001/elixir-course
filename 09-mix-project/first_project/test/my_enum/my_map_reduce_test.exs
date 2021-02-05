defmodule MyMapReduceTest do
  use ExUnit.Case
  doctest MyMapReduce

  test "doubles each element in a list" do
    import MyMapReduce, only: [double: 1]
    assert_raise FunctionClauseError, fn ->
      double(2)
    end
    assert double([]) == []
    assert double([1, 3, 5, 6]) == ([2, 6, 10, 12])
  end

  test "sum each element in a list returning a single result" do
    import MyMapReduce, only: [sum: 1]
    assert_raise FunctionClauseError, fn ->
      sum(1)
    end
    assert sum([]) == 0
    assert sum([1, 2]) == 3
    assert sum([1, 2, 3, 6]) == 12
  end

  test "reduce sum" do
    import MyMapReduce, only: [reduce: 3]
    assert_raise FunctionClauseError, fn ->
      reduce(0, 0,"1")
    end
    assert_raise FunctionClauseError, fn ->
      reduce([], 0,"1")
    end
    assert reduce([], 0, &(&1 + &2)) == 0
    assert reduce([1, 2], 0, &(&1 + &2)) == 3
    assert reduce([1, 2, 3, 6], 0, &(&1 + &2)) == 12
  end

  test "filter is even" do
    import MyMapReduce, only: [filter: 2]
    assert_raise FunctionClauseError, fn ->
      filter(0, "1")
    end
    assert filter([], &(rem(&1, 2) == 0)) == []
    assert filter([3, 4, 5, 6], &(rem(&1, 2) == 0)) == [4, 6]
  end

  test "map Add one" do
    import MyMapReduce, only: [map: 2]
    assert_raise FunctionClauseError, fn ->
      map(0, "1")
    end
    assert_raise FunctionClauseError, fn ->
      map([], "1")
    end
    assert_raise FunctionClauseError, fn ->
      map([], fn -> 15 end)
    end
    assert_raise FunctionClauseError, fn ->
      map([], &(&1 + &2))
    end
    func = &(&1 + 1)
    assert map([], func) == []
    assert map([4], func) == [5]
    assert map([1, 2, 3, 4], func) == [2, 3, 4, 5]
  end
end
