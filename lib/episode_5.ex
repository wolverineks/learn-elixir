defmodule Episode5 do

  @moduledoc """
  Defines functions from Episode 5.
  - blank?
  - better_blank?
  - guard_blank
  - zero?
  """

  @doc """
  Checks if the parameter is blank.

  ## Parameters

  - Any single value or variable.

  ## Examples
  
      iex> variable = ""
      ...> Episode5.blank?(variable)
      true
  """
  def blank?(), do: true
  def blank?(param) when param in [nil, false, ""], do: true
  def blank?(_other), do: false

  @doc """
  Checks if the parameter is blank.

  ## Parameters

  - Any single value or variable.

  ## Examples

      iex> variable = ""
      ...> Episode5.better_blank?(variable)
      true
  """
  def better_blank?(), do: true
  def better_blank?(param), do: param in [nil, false, ""]

  @doc """
  Checks if the parameter is blank.

  ## Parameters

  - Any single value or variable.

  ## Examples

      iex> variable = ""
      ...> Episode5.guard_blank?(variable)
      true
  """
  def guard_blank?(value) do
    case value do
      value when value in [nil, false, ""] -> true
      _ -> false
    end
  end

  @doc """
  Checks if the parameter is zero.

  ## Parameters

  - Any single value or variable.

  ## Examples

      iex> variable = 0
      ...> Episode5.zero?(variable)
      true
  """
  def zero?(0), do: true
  def zero?(value) when is_number(value), do: false
end
