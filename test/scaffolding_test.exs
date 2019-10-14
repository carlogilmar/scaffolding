defmodule ScaffoldingTest do
  use ExUnit.Case
  doctest Scaffolding

  test "Get app names" do
    mix_dummy_names = [:toy_app_engine, :server_hello_world, :phxtoy, :dummy]
    [app1, app2, app3, app4] = for name <- mix_dummy_names, do: ScaffoldingUtil.get_app_names(name)
    assert app1 == {:toy_app_engine, "ToyAppEngine", "ToyAppEngineWeb"}
    assert app2 == {:server_hello_world, "ServerHelloWorld", "ServerHelloWorldWeb"}
    assert app3 == {:phxtoy, "Phxtoy", "PhxtoyWeb"}
    assert app4 == {:dummy, "Dummy", "DummyWeb"}
  end
end
