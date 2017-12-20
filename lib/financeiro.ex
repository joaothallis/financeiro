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
      # Usuários de exemplo 
      maria: Moeda.novo(),
      stone: Moeda.novo(),
      john: Moeda.novo()
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
