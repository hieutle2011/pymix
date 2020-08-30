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

defmodule Ex52 do
  @data [
    %{
      name: "Hoang",
      phone: "0988888888",
      languages: [
        "Python",
        "C",
        "SQL",
        "HTML",
        "CSS",
        "JavaScript",
        "Golang"
      ]
    },
    %{name: "Duy", girl_friend: "Maria"},
    %{name: "Dai", girl_friend: "Angela"},
    %{name: "Tu"}
  ]

  def solve() do
    hoang_old_langs = Enum.find(@data, &(&1.name == "Hoang"))[:languages]

    @data
    |> Enum.map(&update(&1, %{languages: hoang_old_langs}))
  end

  def update(%{name: "Hoang", languages: langs} = student, _) do
    with new_langs <- langs ++ ["Elixir"] do
      student
      |> Map.merge(%{languages: new_langs})
    end
  end

  def update(%{name: "Tu"} = student, langs) do
    student
    |> Map.put(:girl_friend, "Do Anh")
    |> Map.merge(langs)
  end

  def update(%{name: "Duy"} = student, langs) do
    student
    |> Map.delete(:girl_friend)
    |> Map.merge(langs)
  end

  def update(student, langs) do
    student |> Map.merge(langs)
  end
end

defmodule Ex53 do
  @pattern ["”", ".", "“", ",", "’", ";"]

  def solve(data) when is_binary(data) do
    data
    |> String.replace(@pattern, "")
    |> String.downcase()
    |> String.split(" ")
    |> Enum.frequencies()
    |> Map.to_list()
    |> Enum.sort(&(elem(&1, 1) > elem(&2, 1)))
    |> Enum.take(10)
  end
end

defmodule Ex54 do
  @number_of_line 30_000_000
  @str "111111111111111111111111111111\n"
  def solve() do
    stream =
      1..@number_of_line
      |> Stream.map(&do_map/1)

    stream
    |> Stream.into(File.stream!("/tmp/big_file.txt"))
    |> Stream.run()

    stream
    |> Stream.take(-10)
    |> Enum.to_list()
  end

  def do_map(num) when rem(num, 2) == 1, do: @str
  def do_map(num), do: to_string(num * 2) <> "\n"
end

defmodule Ex56 do
  def solve(obj_1, obj_2) do
    Map.merge(obj_1, obj_2)
  end
end
