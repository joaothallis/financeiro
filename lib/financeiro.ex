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
        Cadastro.cria_usuario(usuarios)
      true ->
        IO.puts "Digite apenas 1 ou 2"
        main([])
    end
  end

  @doc """
  Faz acesso a conta do usuário.

  É feita uma verificação na estrutura de dados para confirmar se o usuário existe

  """
  def acessar(usuarios) do
    usuario = IO.gets "Digite seu nome de usuário: "
    usuario = string_atom(usuario)
    # Verifica se o usuário existe
    case Keyword.fetch(usuarios, usuario) do
      :error ->
        IO.puts "Usuário não existe."
        acessar(usuarios)
      _ ->
        IO.puts "Acesso realizado com sucesso."
        alternativas(usuarios, usuario)
    end
  end


  @doc """
  Transforma uma string em atom.
  
  """
  def string_atom(usuario) do
    usuario = String.trim(usuario)
    usuario = String.to_atom(usuario)
  end
  
  @doc """
  Opções que o usuário pode escolher.

  """
  def alternativas(usuarios, usuario) do
    opcao = IO.gets "Digite 1 para verificar saldo, 2 para realizar depósito, 3 para realizar transferência ou 4 para realizar câmbio de moedas: "
    cond do
      opcao == "1\n" ->
        Consulta.verifica_saldo(usuarios, usuario)
        alternativas(usuarios, usuario)
      opcao == "2\n" ->
        Transacao.deposito(usuarios, usuario)
      opcao == "3\n" ->
        Transacao.transferencia(usuarios, usuario)
      true ->
        IO.puts "Digite apenas 1, 2, 3 ou 4"
        alternativas(usuarios, usuario)
    end
  end
end
