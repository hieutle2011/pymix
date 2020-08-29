defmodule Ex51 do
  @data %{
    green: "#3cba54",
    yellow: "#f4c20d",
    red: "#db3236",
    blue: "#4885ed"
  }
  def solve() do
    result =
      [G: :blue, o: :red, o: :yellow, g: :blue, l: :green, e: :red]
      |> Enum.map(fn {char, color} -> {char, @data[color]} end)

    content =
      result
      |> Enum.map(fn item -> span(item) end)
      |> Enum.reduce(fn ele, acc -> ele <> acc end)

    with {:ok, file} = File.open("/tmp/google.html", [:write]),
         :ok <- IO.binwrite(file, content),
         :ok <- File.close(file) do
      result
    end
  end

  def span({char, code}) do
    "<span style='color:#{code}'>#{char}</span>\n"
  end
end
