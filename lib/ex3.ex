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
    with {name, _ext} <- do_extract_v2(fname) do
      name
    end
  end

  def do_extract_v2(fname) when is_binary(fname) do
    case String.contains?(fname, ".") do
      false -> {fname, nil}
      true -> extract_v2(fname)
    end
  end

  def do_extract_v2(_), do: raise(ArgumentError, message: "fname should be string")

  def extract_v2(fname, name \\ "")

  def extract_v2(fname, name) when is_binary(fname) do
    with arr = String.graphemes(fname),
         [head | tail] = arr do
      case Enum.find(tail, &(&1 == ".")) do
        nil ->
          {name, Enum.join(tail)}

        _ ->
          name = name <> head
          fname = Enum.join(tail)
          extract_v2(fname, name)
      end
    end
  end
end
