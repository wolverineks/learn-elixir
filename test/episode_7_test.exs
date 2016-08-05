defmodule Episode7Test do
  use ExUnit.Case
  doctest Episode7
  import Episode7

  test "list_months" do
    assert list_months(18) == ["January", "February", "March",
    "April", "May", "June", "July", "August", "September", "October",
    "November", "December", "January", "February", "March", "April", "May",
    "June"]
  end

  test "every_other_d" do
    assert every_other_d("../lib/sample.txt") == ["Drum", "Drill", "Diamond", "Data base"]
  end

end
