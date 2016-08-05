defmodule Episode5 do

  def blank?(), do: true
  def blank?(param) when param in [nil, false, ""], do: true
  def blank?(_other), do: false

  def better_blank?(), do: true
  def better_blank?(param), do: param in [nil, false, ""]

  def guard_blank?(value) do
    case value do
      value when value in [nil, false, ""] -> true
      _ -> false
    end
  end

  def zero?(0), do: true
  def zero?(value) when is_number(value), do: false
end
