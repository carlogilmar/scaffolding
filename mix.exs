defmodule Scaffolding.MixProject do
  use Mix.Project

  def project do
    [
      app: :scaffolding,
      version: "0.1.0",
      elixir: "~> 1.9",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "scaffolding",
      source_url: "https://github.com/carlogilmar/scaffolding",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp description do
    """
      Scaffolding dep for generate view controllers and live views
    """
  end

  defp package do
    [
      name: "scaffolding",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Carlo Gilmar"],
      licenses: ["BSD 3-Clause License"],
      links: %{"GitHub" => "https://github.com/carlogilmar/scaffolding"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
