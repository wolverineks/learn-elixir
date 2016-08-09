defmodule Episode8Test do
  use ExUnit.Case, async: true
  doctest Episode8
  import Episode8

  test "even_numbers" do
    assert even_numbers(15) == [2, 4, 6, 8, 10, 12, 14]
  end

# is this cheating?
  test "join_list" do
    assert join_list(["a", "b", "c", "d", "e"], "-") == "-a-b-c-d-e"
  end

end
