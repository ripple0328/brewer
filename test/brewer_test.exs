defmodule BrewerTest do
  use ExUnit.Case
  doctest Brewer

  test "greets the world" do
    assert Brewer.hello() == :world
  end
end
