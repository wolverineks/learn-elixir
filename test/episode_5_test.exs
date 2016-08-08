defmodule Episode5Test do
  use ExUnit.Case, async: true
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
    result =
      case 1 + 1 do
        2 -> "2"
        _other -> "default"
      end

    assert result = 2
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
      result = "still true"
    end

    assert result == "still true"
  end

  test "blank? with guard" do
    assert blank?()
    assert blank?(nil)
    assert blank?(false)
    assert blank?("")
    refute blank?("abc")
  end

  test "" do
    assert better_blank?()
    assert better_blank?(nil)
    assert better_blank?(false)
    assert better_blank?("")
    refute better_blank?("abc")
  end

  test "case with guard" do
    assert guard_blank?(nil)
    assert guard_blank?(false)
    assert guard_blank?("")
    refute guard_blank?("abc")
  end

  test "zero? with guard" do
    assert zero?(0)
    refute zero?(1)
    assert_raise FunctionClauseError, fn -> zero?("abc") end
  end
end
