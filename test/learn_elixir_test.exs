defmodule LearnElixirTest do
  use ExUnit.Case
  doctest LearnElixir

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "even_numbers" do
    assert LearnElixir.even_numbers(15) == [2, 4, 6, 8, 10, 12, 14]
  end

# is this cheating?
  test "join_list" do
    assert LearnElixir.join_list(["a", "b", "c", "d", "e"], "-") == "a-b-c-d-e-"
  end
end
