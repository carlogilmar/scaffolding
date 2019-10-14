defmodule ScaffoldingTest do
  use ExUnit.Case
  doctest Scaffolding

  test "Get app names" do
    mix_dummy_names = [:toy_app_engine, :server_hello_world, :phxtoy, :dummy]
    [app1, app2, app3, app4] = for name <- mix_dummy_names, do: ScaffoldingUtil.get_app_names(name)
    assert app1 == {:toy_app_engine, "toy_app_engine", "ToyAppEngineWeb"}
    assert app2 == {:server_hello_world, "server_hello_world", "ServerHelloWorldWeb"}
    assert app3 == {:phxtoy, "phxtoy", "PhxtoyWeb"}
    assert app4 == {:dummy, "dummy", "DummyWeb"}
  end
end
