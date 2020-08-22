defmodule Ex31 do
  alias Math

  def solve(number) do
    number
    |> int_to_string()
    |> do_solve()
    |> String.to_integer()
  end

  def int_to_string(number, base \\ 2)

  def int_to_string(number, base) do
    number
    |> Integer.digits(base)
    |> Enum.join("")
  end

  def do_solve(str) do
    with length <- String.length(str),
         power <- Math.power(10, length - 1),
         binary_int <- String.to_integer(str) do
      case rem(binary_int, power) do
        0 ->
          str

        _ ->
          {_, next_grapheme} = String.next_grapheme(str)
          do_solve(next_grapheme)
      end
    end
  end

  def main() do
    for x <- 1..10, do: {x, {int_to_string(x), solve(x)}}
  end
end
