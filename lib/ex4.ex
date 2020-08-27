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

defmodule Ex42 do
  @target 0o777

  @doc """
    Trả về giá trị cần cộng thêm với octal để thu được 0o777

    Với người dùng Unix(Ubuntu, MacOS,...), mode của một file được biểu diễn ở
    dạng Octal, VD: 644, 400, 777...

    Gợi ý:

    In [1]: oct(73)
    Out[1]: '0o111'
  """
  def solve(octal) do
    @target - octal
  end
end

defmodule Ex43 do
  @offset ?a - 1
  def solve(str) do
    str
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(&(&1 - @offset))
    |> Enum.sum()
  end
end

# TODO: Refactor later
defmodule Ex44 do
  def solve() do
    do_solve() |> Enum.count()
    # do_solve()
  end

  def do_solve() do
    for a <- 1..9,
        b <- 1..9,
        c <- 1..9,
        d <- 1..9,
        e <- 1..9,
        f <- 1..9,
        g <- 1..9,
        h <- 1..9,
        i <- 1..9,
        cond(a, b, c, d, e, f, g, h, i),
        do: 1
  end

  def cond(a, b, c, d, e, f, g, h, i) do
    13 * b * i + g * h * c == (87 + f - (a + d + 12 * e)) * c * i
  end
end

defmodule Ex45 do
  def solve(numbers), do: solve(numbers, 0, 1)
  def solve([h | t], sum, prod), do: solve(t, h + sum, h * prod)
  def solve([], 0, _prod), do: {0, 0}
  def solve([], sum, prod), do: {sum, prod}
end

defmodule Ex46 do
  def solve(str) when is_binary(str) do
    str
    |> String.to_charlist()
    |> solve([])
  end

  def solve([]) do
    []
  end

  def solve([h | t], arr) when h >= ?0 and h <= ?9 do
    solve(t, [h | arr])
  end

  def solve([_ | t], [',' | _] = arr) do
    solve(t, arr)
  end

  def solve([_ | t], arr) do
    solve(t, [',' | arr])
  end

  def solve([], arr) do
    arr
    |> to_string()
    |> String.reverse()
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer(&1))
  end
end

defmodule Ex47 do
  @can ["giáp", "ất", "bính", "đinh", "mậu", "kỷ", "canh", "tân", "nhâm", "quý"]
  @chi ["tý", "sửu", "dần", "mão", "thìn", "tị", "ngọ", "mui", "thân", "dậu", "tuất", "hợi"]
  @can_length 10
  @chi_length 12
  # 2017 Dinh Dau
  # rem(2017, 10) = 7 -> move 6 steps to 3rd index (Dinh)
  @can_offset 6
  # rem(2017, 12) = 1 -> move 8 stesp to 9th index (Dau)
  @chi_offset 8
  def solve(year) do
    with can <- Enum.at(@can, rem(year + @can_offset, @can_length)),
         chi <- Enum.at(@chi, rem(year + @chi_offset, @chi_length)) do
      String.capitalize(can) <> " " <> String.capitalize(chi)
    end
  end
end

defmodule Ex48 do
  @perimeter 24
  def solve() do
    for a <- 1..10,
        b <- 1..10,
        cond(a, b, @perimeter - a - b),
        do: {a, b, @perimeter - a - b}
  end

  def cond(a, b, c) do
    a * a + b * b == c * c
  end
end

defmodule Ex49 do
  def solve([]) do
    raise Enum.EmptyError
  end

  def solve([_ | _] = arr) do
    solve(arr, nil)
  end

  def solve([head | tail], nil) do
    solve(tail, head)
  end

  def solve([head | tail], max) when head > max do
    solve(tail, head)
  end

  def solve([_head | tail], max) do
    solve(tail, max)
  end

  def solve([], max) do
    max
  end
end
