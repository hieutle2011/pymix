defmodule Ex31 do
  @moduledoc """
  Solution for ex31
  """
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

  def main do
    for x <- 1..10, do: {x, {int_to_string(x), solve(x)}}
  end
end

defmodule Ex32 do
  @moduledoc """
  Solution for ex32
  """
  def solve(str) do
    str
    |> String.split("\n", trim: true)
    |> Enum.map(&String.first(&1))
    |> Enum.join("")
    |> String.upcase()
  end
end

defmodule Ex33 do
  @moduledoc """
  Solution for ex33
  """
  def solve, do: 1..100 |> Enum.map(&do_solve/1)

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
  @moduledoc """
  Solution for ex34
  """
  def solve(fname), do: rootname(fname)

  def rootname(fname) when is_binary(fname) do
    rootname(String.to_charlist(fname))
  end

  def rootname(fname0) do
    rootname(fname0, [], [])
  end

  def rootname([?/ | rest], root, ext) do
    rootname(rest, '/' ++ ext ++ root, [])
  end

  def rootname([?. | rest], root, []) do
    rootname(rest, root, '.')
  end

  def rootname([?. | rest], root, ext) do
    rootname(rest, ext ++ root, '.')
  end

  def rootname([char | rest], root, []) when is_integer(char) do
    rootname(rest, [char | root], [])
  end

  def rootname([char | rest], root, ext) when is_integer(char) do
    rootname(rest, root, [char | ext])
  end

  def rootname([], root, _ext) do
    root |> Enum.reverse() |> to_string()
  end
end

defmodule Ex35 do
  @moduledoc """
  Solution for ex35
  """
  def solve(arr) do
    arr
    |> Enum.with_index(1)
    |> Enum.map(fn {elem, idx} -> [idx, elem] end)
  end
end

defmodule Ex36 do
  @moduledoc """
  Solution for ex36
  """
  def solve(month) do
    case month do
      1 -> {"January", 31}
      2 -> {"February", 28}
      3 -> {"March", 31}
      4 -> {"April", 30}
      7 -> {"July", 31}
      8 -> {"August", 31}
      9 -> {"September", 30}
      10 -> {"October", 31}
      11 -> {"November", 30}
      12 -> {"December", 31}
      _ -> "Month doesn't exist"
    end
  end
end

defmodule Ex37 do
  @moduledoc """
  Solution for ex37
  """
  def solve do
    1..19
    |> Enum.map(&do_ex37/1)
  end

  def do_ex37(num) do
    "#{num * 5} == #{num} * 5"
  end
end

defmodule Ex38 do
  @moduledoc """
  Solution for ex38
  """
  def solve(str) do
    if String.length(str) <= 2 do
      false
    else
      newstr =
        str
        |> String.replace(" ", "")
        |> String.downcase()

      newstr == String.reverse(newstr)
    end
  end
end

defmodule Ex39 do
  @moduledoc """
  Solution for ex39
  """
  def solve do
    for a <- 9..1, b <- 1..9, c <- 1..9, check(a, b, c), do: {a, b, c}
  end

  def check(a, b, c), do: a * c + b == 10 * c
end
