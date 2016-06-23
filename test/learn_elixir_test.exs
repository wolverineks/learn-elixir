defmodule LearnElixirTest do
  use ExUnit.Case
  doctest LearnElixir
  import LearnElixir
  import Kernel, except: [sigil_w: 2]

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

  test "list_months" do
    assert list_months(18) == ["January", "February", "March",
    "April", "May", "June", "July", "August", "September", "October",
    "November", "December", "January", "February", "March", "April", "May",
    "June"]
  end

  test "every_other_d" do
    assert every_other_d("../lib/sample.txt") == ["Drum", "Drill", "Diamond", "Data base"]
  end

  test "even_numbers" do
    assert even_numbers(15) == [2, 4, 6, 8, 10, 12, 14]
  end

# is this cheating?
  test "join_list" do
    assert join_list(["a", "b", "c", "d", "e"], "-") == "a-b-c-d-e-"
  end

  test "my_custom_sigil" do
    assert ~z(20349587) == 141610188604   # split, to int, map to doubl, reverse, join, to int
  end

  test "overriding sigil" do
    assert ~w(how are you doing?) == ["How", "Are", "You", "Doing?"]
  end
end
