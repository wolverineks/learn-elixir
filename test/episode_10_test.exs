defmodule Episode10Test do
  use ExUnit.Case, async: true
  doctest Episode10
  import Episode10

  test "encrypt" do
    assert encrypt("Hello, World!") == "Test: !dlroW ,olleH"
  end
end
