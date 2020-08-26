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
  def solve(arr) do
    solve(arr, 0, 1)
  end

  def solve([head | tail], sum, prod) do
    solve(tail, head + sum, head * prod)
  end

  def solve([], sum, prod) do
    {sum, prod}
  end
end
