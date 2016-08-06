defmodule Episode6Test do
  use ExUnit.Case
  doctest Episode6
  import Episode6

  test "map" do
    list = [1, 2, 3]
    function = fn(number) -> number * 2 end
    assert map(list, function) == [2, 4, 6]
  end

  test "sum_list" do
    assert sum_list([1, 2, 3, 4, 5]) == 15
  end

  test "generalized_sum" do
    assert generalized_sum([1, 2, 3, 4, 5], fn num -> num + 2 end) == 25
  end

  test "reverse" do
    assert reverse([1,2,3,4,5]) == [5,4,3,2,1]
  end

  test "new_reverse" do
    assert new_reverse([1,2,3,4,5]) == [5,4,3,2,1]
  end
end
