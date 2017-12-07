defmodule Financeiro.Application do
  # Veja https://hexdocs.pm/elixir/Application.html
  # para obter mais informações sobre Aplicativos OTP
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Financeiro.Worker.start_link(arg)
      # {Financeiro.Worker, arg},
    ]

    # Veja https://hexdocs.pm/elixir/Supervisor.html
    # para outras estratégias e opções suportadas
    opts = [strategy: :one_for_one, name: Financeiro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
