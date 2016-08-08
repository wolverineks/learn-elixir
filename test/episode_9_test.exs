 defmodule Episode9Test do
  use ExUnit.Case, async: true
  doctest Episode9
  import Episode9
  import MySigils
  import Kernel, except: [sigil_w: 2]

  test "sigil_s" do
    assert ~s("hello") == "\"hello\""
  end

  test "sigil_c" do
    assert ~c(Alan's Computer) == 'Alan\'s Computer'
  end

  test "my_custom_sigil" do
    assert ~z(20349587) == 141610188604   # split, to int, map to doubl, reverse, join, to int
  end

  test "overriding sigil" do
    assert ~w(how are you doing?) == ["How", "Are", "You", "Doing?"]
  end
end
