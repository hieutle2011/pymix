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

defmodule Ex32 do
  def solve(str) do
    str
    |> String.split("\n", trim: true)
    |> Enum.map(&String.first(&1))
    |> Enum.join("")
    |> String.upcase()
  end
end

defmodule Ex33 do
  def solve(), do: 1..100 |> Enum.map(&do_solve/1)

  def do_solve(num) do
    cond do
      rem(num, 15) == 0 ->
        "FizzBuzz"

      rem(num, 5) == 0 ->
        "Buzz"

      rem(num, 3) == 0 ->
        "Fizz"

      true ->
        num
    end
  end
end

defmodule Ex34 do
  def solve(fname) do
    with {name, _ext} <- extract(fname) do
      name
    end
  end

  def extract(fname, ext_len \\ 3)

  def extract(fname, ext_len) when is_binary(fname) do
    with len <- String.length(fname),
         dot_index <- len - ext_len - 1,
         name <- String.slice(fname, 0, dot_index),
         ext <- String.slice(fname, dot_index, len - 1) do
      {name, ext}
    end
  end

  def extract(_, _), do: raise(ArgumentError, message: "fname should be string")
end
