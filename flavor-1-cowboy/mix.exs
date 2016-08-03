defmodule HelloWorld.Mixfile do
  use Mix.Project

  def project do
    [app: :hello_world,
     version: "0.1.0",
     elixir: "~> 1.3",
     deps: deps()]
  end

  def application do
    [
      mod: {HelloWorld, []},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_), do: [:logger, :cowboy]

  defp deps do
    [
      {:cowboy, tag: "2.0.0-pre.3", git: "https://github.com/ninenines/cowboy"},
      {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end