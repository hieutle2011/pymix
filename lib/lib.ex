defmodule Math do
  @moduledoc """
  Additional math functions
  """
  def power(_, 0), do: 1
  def power(n, 1), do: n

  def power(a, b) do
    :math.pow(a, b) |> round()
  end
end
