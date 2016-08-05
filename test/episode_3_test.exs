defmodule Episode3Test do
  use ExUnit.Case
  doctest Episode2
  import Episode2

  test "=" do
    a = 5
    {1, b} = {1, 2}
    {^a, c} = {5, 3}

    assert a == 5
    assert b == 2
    assert c == 3
  end

  test "+" do
    assert 5 + 5 == 10
  end

  test "-" do
    assert 5 - 5 == 0
  end

  test "/" do
    assert 5 / 5 == 1
  end

  test "*" do
    assert 5 * 5 == 25
  end

  test "rem" do
    assert rem(10, 2) == 0
    assert rem(11, 2) == 1
  end

  test ">" do
    assert 5 > 4
    refute 3 > 4
  end

  test "<" do
    assert 3 < 4
    refute 5 < 4
  end

  test ">=" do
    assert 5 >= 4
    assert 5 >= 5
    refute 3 >= 4
    refute 3 >= 5
  end

  test "<=" do
    assert 3 <= 4
    assert 3 <= 3
    refute 5 <= 4
    refute 5 <= 3
  end

  test "==" do
    assert 5 == 5
    refute 5 == 4
  end

  test "!=" do
    assert 5 != 4
    refute 5 != 5
  end

  test "===" do
    assert 5 === 5
    refute 5 === 5.0
  end

  test "!==" do
    assert 5 !== 5.0
    refute 5 !== 5
  end

  test "in" do
    list = [1, 2, 3, 4, 5]

    assert 1 in list
    refute 0 in list
  end

  test "++" do
    list1 = [1, 2, 3]
    list2 = [4, 5, 6]

    assert list1 ++ list2 == [1, 2, 3, 4, 5, 6]
  end

  test "--" do
    list1 = [1, 2, 3]
    list2 = [2, 3]

    assert list1 -- list2 == [1]
  end

  test "|" do
    list = [1, 2, 3]

    assert [0 | list] == [0, 1, 2, 3]
  end

  test "[h|t]" do
    list = [1, 2, 3]
    [h|t] = list

    assert h == 1
    assert t == [2, 3]
  end

  test "<>" do
    assert "abc" <> "def" == "abcdef"
  end

  test "#{}" do
    letters = "def"

    assert "abc#{letters}" == "abcdef"
  end

  test "=~" do
    assert "Goodbye" =~ "Good"
    assert "Goodbye" =~ ~r/o{2}/
    refute "Goodbye" =~ "Hello"
  end

  test "&&" do
    assert true && true
    refute true && false
  end

  test "||" do
    assert true || true
    assert true || false
    assert false || true
    refute false || false
  end

end
