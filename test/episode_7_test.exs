defmodule Episode7Test do
  use ExUnit.Case, async: true
  doctest Episode7
  import Episode7

  test "Enum.at" do
    list = [1, 2, 3, 4, 5]

    assert Enum.at(list, 0) == 1
  end

  test "Enum.filter" do
    list = [1, 2, 3, 4, 5]
    is_even = fn(number) -> rem(number, 2) == 0 end

    assert Enum.filter(list, is_even) == [2, 4]
  end

  test "Enum.reduce" do
    list = [1, 2, 3, 4, 5]
    get_sum = fn(number, accumulator) ->
      accumulator + number
    end

    assert Enum.reduce(list, 0, get_sum) == 15
  end

  test "Enum.into" do
    list = [a: 1, b: 2]
    map  = Enum.into(list, %{})

    assert map == %{a: 1, b: 2}
    assert is_map(map)
  end

  test "Enum.take" do
    result = Enum.take(1..10, 5)

    assert result == [1, 2, 3, 4, 5]
  end

  test "capture operator" do
    result = Enum.reduce([1, 2, 3, 4, 5], &(&1 + &2))

    assert result = 15
  end

  test "list_months" do
    assert list_months(18) == ["January", "February", "March",
    "April", "May", "June", "July", "August", "September", "October",
    "November", "December", "January", "February", "March", "April", "May",
    "June"]
  end

  test "every_other_d" do
    assert every_other_d("lib/sample.txt") == ["Drum", "Drill", "Diamond", "Data base"]
  end

end
