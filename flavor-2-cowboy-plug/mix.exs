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
  defp applications(_), do: [:cowboy, :plug]

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end