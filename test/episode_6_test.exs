defmodule Episode6Test do
  use ExUnit.Case
  doctest Episode6
  import Episode6

  test "sum_list" do
    assert sum_list([1, 2, 3, 4, 5]) == 15
  end

  test "generalized_sum" do
    assert generalized_sum([1, 2, 3, 4, 5], fn num -> num + 2 end) == 25
  end

  test "reverse" do
    assert reverse([1,2,3,4,5]) == [5,4,3,2,1]
  end

end
