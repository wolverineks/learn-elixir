defmodule LearnElixirTest do
  use ExUnit.Case
  doctest LearnElixir
  import LearnElixir

  test "the truth" do
    assert 1 + 1 == 2
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

  test "even_numbers" do
    assert even_numbers(15) == [2, 4, 6, 8, 10, 12, 14]
  end

# is this cheating?
  test "join_list" do
    assert join_list(["a", "b", "c", "d", "e"], "-") == "a-b-c-d-e-"
  end
end
