defmodule Ex3Test do
  use ExUnit.Case

  test "Part from last 1 of binary of 10 is 10" do
    assert Ex31.solve(10) == 10
  end

  test "Part from last 1 of binary of 9 is 1" do
    assert Ex31.solve(9) == 1
  end

  test "Print out result for from 1->9" do
    assert Ex31.main() == [
             {1, {"1", 1}},
             {2, {"10", 10}},
             {3, {"11", 1}},
             {4, {"100", 100}},
             {5, {"101", 1}},
             {6, {"110", 10}},
             {7, {"111", 1}},
             {8, {"1000", 1000}},
             {9, {"1001", 1}},
             {10, {"1010", 10}}
           ]
  end

  test "Ex32 " do
    data = """
    Come to the
    River
    Of my
    Soulful
    Sentiments
    Meandering silently
    Yearning for release.
    Hasten
    Earnestly
    As my love flows by
    Rushing through the flood-gates
    To your heart.
    """

    assert Ex32.solve(data) == "CROSSMYHEART"
    assert Ex32.solve("P\nY\nm\nI") == "PYMI"
  end

  test "Ex33 FizzBuzz" do
    cases =
      [{1, 1}, {2, 2}, {3, "Fizz"}, {5, "Buzz"}, {15, "FizzBuzz"}] |> Enum.map(fn {_, r} -> r end)

    result = Ex33.solve()
    rhs = [1, 2, 3, 5, 15] |> Enum.map(fn i -> Enum.at(result, i - 1) end)
    assert cases == rhs
  end
end
