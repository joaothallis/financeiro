defmodule Financeiro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :financeiro,
      version: "1.1.5",
      escript: escript(),
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  defp escript do
    [main_module: Financeiro]
  end

  # Execute "mix help compile.app" para saber mais sobre applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Financeiro.Application, []}
    ]
  end

  # Execute "mix help deps" para saber mais sobre as dependências.
  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end
end
