defmodule Financeiro do
  @moduledoc """
  Início do sistema.
  Através desse módulo o usuário escolhe quais operações fazer.
  """

  @doc """
  Inicia o sistema financeiro.

  """
  def main([]) do
    alfa(usr_padrao())
  end

  @doc """
  Criação dos usuários de exemplo.
  
  Cada um recebem uma lista com as moedas do padrão ISO 4217.

  """
  def usr_padrao do
    [
      # Usuários de exemplo. 
      maria: Moeda.novo(),
      stone: Moeda.novo(),
      john: Moeda.novo()
    ] 
  end

  @doc """
  Leva o usuário a criar um cadastro ou entrar com um existente.

  ## Parâmetro

    - usuarios: Lista com os nomes de usuários e suas respectivas quantias de dinheiro.

  """
  def alfa(usuarios) do
    escolha = IO.gets "Sistema Financeiro\nDigite 1 para entrar ou 2 para criar um cadastro: "
    escolha = String.trim(escolha)
    cond do
      escolha == "1" ->
        acessar(usuarios)
      escolha == "2" ->
        Cadastro.cria_usuario(usuarios)
      true ->
        IO.puts "Digite apenas 1 ou 2"
        alfa(usuarios)
    end
  end

  @doc """
  Realiza acesso a conta do usuário.

  """
  def acessar(usuarios) do
    usuario = IO.gets "Digite seu nome de usuário: "
    usuario = string_atom(usuario)
    case verifica_usuario(usuarios, usuario) do
      :error ->
        IO.puts "Usuário não existe."
        acessar(usuarios)
      _ -> alternativas(usuarios, usuario)
    end
  end

  @doc """
  É feita uma verificação na estrutura de dados para confirmar se o usuário existe.

  """
  def verifica_usuario(usuarios, usuario) do
    Keyword.fetch(usuarios, usuario) 
  end

  @doc """
  Remove espaço e transforma string em atom.

  ## Exemplos

      iex> Financeiro.string_atom("Roberta \n)
      :Roberta

      iex> Financeiro.string_atom("Lucas \n")
      :Lucas
  
  """
  def string_atom(usuario) do
    usuario = String.trim(usuario) 
    String.to_atom(usuario)
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
      opcao == "4\n" ->
        Cambio.cambio_moeda(usuarios, usuario)
      true ->
        IO.puts "Digite apenas 1, 2, 3 ou 4"
        alternativas(usuarios, usuario)
    end
  end
end
