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
