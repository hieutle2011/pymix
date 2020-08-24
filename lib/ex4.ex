defmodule Ex41 do
  def solve(str) do
    str
    |> String.split(".")
    |> Enum.map(&parse/1)
    |> Enum.join(".")
  end

  @base_2 2
  @num_length 8
  @zero "0"

  def parse(str) do
    str
    |> String.to_integer()
    |> Integer.to_string(@base_2)
    |> String.pad_leading(@num_length, @zero)
  end
end
