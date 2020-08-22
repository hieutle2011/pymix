defmodule PymixTest do
  use ExUnit.Case
  doctest Pymix

  test "greets the world" do
    assert Pymix.hello() == :world
  end
end
