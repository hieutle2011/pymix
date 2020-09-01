defmodule Main do
  @moduledoc """
  Useful functions
  """
  def vanila_reverse([h | t], arr), do: vanila_reverse(t, [h | arr])
  def vanila_reverse([], arr), do: arr

  @spec sum_list([number]) :: number()
  def sum_list(arr), do: sum_list(arr, 0)

  @spec sum_list([number], number()) :: number()
  def sum_list([h | t], sum), do: sum_list(t, h + sum)
  def sum_list([], sum), do: sum
end
