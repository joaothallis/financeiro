defmodule Financeiro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :financeiro,
      version: "0.3.9",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
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
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
