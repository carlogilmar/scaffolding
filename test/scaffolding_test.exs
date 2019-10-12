defmodule ScaffoldingTest do
  use ExUnit.Case
  doctest Scaffolding

  test "greets the world" do
    assert Scaffolding.hello() == :world
  end
end
