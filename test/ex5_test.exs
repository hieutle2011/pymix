defmodule Ex5Test do
  use ExUnit.Case

  test "51" do
    assert Ex51.solve() == [
             G: "#4885ed",
             o: "#db3236",
             o: "#f4c20d",
             g: "#4885ed",
             l: "#3cba54",
             e: "#db3236"
           ]
  end
end
