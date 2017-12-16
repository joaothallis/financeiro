defmodule Financeiro do
  @moduledoc """
  Início do sistema.
  Através desse módulo o usuário escolhe quais operações fazer.
  """

  @doc """
  Inicia o sistema financeiro.

  Leva o usuário a criar um cadastro ou entrar com um existente.

  """
  def main([]) do
    usuarios = [
      # As 2 últimas casas representam as casas decimais.
      john: %{BRL: 000, USD: 000},
      stone: %{BRL: 000, USD: 000}
    ]
    escolha = IO.gets "Sistema Financeiro\nDigite 1 para entrar ou 2 para criar um cadastro: "
    escolha = String.trim(escolha)
    cond do
      escolha == "1" ->
        acessar(usuarios)
      escolha == "2" ->
        criar_usuario(usuarios)
      true ->
        IO.puts "Digite apenas 1 ou 2"
        main([])
    end
  end
end
