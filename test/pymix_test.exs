defmodule PymixTest do
  use ExUnit.Case
  doctest Pymix

  test "greets the world" do
    assert Pymix.hello() == :world
  end

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
end
