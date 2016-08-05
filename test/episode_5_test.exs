defmodule Episode5Test do
  use ExUnit.Case
  doctest Episode5
  import Episode5

  test "cond" do
    user =
      cond do
        1 + 1 == 1 ->
          "This will never happen"
        2 * 2 != 4 ->
          "neither will this"
        true ->
          "User #1"
      end

    assert user = "User #1"
  end

  test "case" do
    math =
      case 1 + 1 do
        2 -> "2"
        _other -> "default"
      end

    assert math = 2
  end

  test "if" do
    user = "user"
    if user do
      username = "user"
    else
      "no user"
    end

    assert username = "user"
  end

  test "unless" do
    unless 1 + 1 != 2 do
      math = "still true"
    end

    assert math == "still true"
  end

  test "blank? with guard" do
    assert blank?()
    assert blank?(nil)
    assert blank?(false)
    assert blank?("")
    refute blank?("abc")
  end

  test "" do
    assert better_blank?()      == true
    assert better_blank?(nil)   == true
    assert better_blank?(false) == true
    assert better_blank?("")    == true
    assert better_blank?("abc") == false
  end

  test "case with guard" do
    assert guard_blank?(nil)   == true
    assert guard_blank?(false) == true
    assert guard_blank?("")    == true
    assert guard_blank?("abc") == false
  end

  test "zero? with guard" do
    assert zero?(0)
    refute zero?(1)
    assert_raise FunctionClauseError, fn -> zero?("abc") end
  end
end
