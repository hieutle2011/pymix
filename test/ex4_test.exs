defmodule Ex4Test do
  use ExUnit.Case

  test "Test Ex41 convert IPv4 to binary presentation" do
    assert Ex41.solve("192.168.1.1") == "11000000.10101000.00000001.00000001"
    assert Ex41.solve("0.0.0.0") == "00000000.00000000.00000000.00000000"
    assert Ex41.solve("208.67.222.222") == "11010000.01000011.11011110.11011110"
  end

  test "Test Ex42 octal number to get 0o777" do
    assert Ex42.solve(0o644) == 0o133
    assert Ex42.solve(0o755) == 0o022
  end

  test "Test Ex43 score of words" do
    assert Ex43.solve("knowledge") == 96
    assert Ex43.solve("hardwork") == 98
    assert Ex43.solve("discipline") == 100
    assert Ex43.solve("attitude") == 100
  end

  describe "Slow test" do
    @describetag :slow
    test "Test Ex44 " do
      assert Ex44.solve() == 453_542
    end
  end

  test "Test Ex45" do
    assert Ex45.solve([1, 2, 3, 4, 5]) == {15, 120}
  end

  test "Test Ex45 empty arr" do
    assert Ex45.solve([]) == {0, 0}
  end
end
