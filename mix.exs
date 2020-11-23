defmodule RabbitExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :rabbit_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        example: [
          config_providers: [Example.Config]
        ]
      ]
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
      {:conduit, "~> 0.12.10"},
      {:conduit_amqp,
       git: "https://github.com/thalesmg/conduit_amqp",
       ref: "3a80470d31a2bb95e3033cf15cdcda8d3da59173"
      }
    ]
  end
end
