defmodule Episode8Test do
  use ExUnit.Case, async: true
  doctest Episode8
  import Episode8
  import Kernel, except: [sigil_w: 2]

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
