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
    [maria: Moeda.novo(), stone: Moeda.novo(), john: Moeda.novo()]
  end

  @doc """
  Leva o usuário a criar um cadastro ou entrar com um existente.

  ## Parâmetro

    - usuarios: Lista com os nomes de usuários e suas respectivas quantias de dinheiro.

  """
  def alfa(usuarios) do
    escolha = entrada("Sistema Financeiro\nDigite 1 para entrar ou 2 para criar um cadastro: ")
    case escolha do
      "1" -> 
        usuario = acessar(usuarios)
        alternativas(usuarios, usuario)
      "2" ->
        usuario = Cadastro.cria_usuario(usuarios)
        usuarios = Cadastro.add_conta(usuarios, usuario)
        Financeiro.alternativas(usuarios, usuario)
      _ ->
        IO.puts "Digite apenas 1 ou 2"
        alfa(usuarios)
    end
  end

  @doc """
  Obtém entrada do usuário e remove espaço.

  ## Parâmetro

      - msg: String com a mensagem para o `IO.gets/1`

  """
  def entrada(msg) do
    obter = IO.gets msg
    String.trim(obter)
  end

  @doc """
  Realiza acesso a conta do usuário.

  """
  def acessar(usuarios) do
    usuario = entrada("Digite seu nome de usuário: ")
    usuario = string_atom(usuario)
    if Consulta.usuario?(usuarios, usuario) == :error do
      IO.puts "Usuário não existe."
      alfa(usuarios)
    else
      usuario
    end
  end

  @doc """
  Remove espaço e transforma string em atom.

  ## Exemplos

      iex> Financeiro.string_atom("Ana_Roberta")
      :Ana_Roberta

      iex> Financeiro.string_atom(" Lucas ")
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
    opcao = entrada("Digite 1 para verificar saldo, 2 para realizar depósito, 3 para realizar transferência ou 4 para realizar câmbio de moedas: ")
    case opcao do
      "1" ->
        Consulta.verifica_saldo(usuarios, usuario)
        alternativas(usuarios, usuario)
      "2" ->
        usuarios = Transacao.deposito(usuarios, usuario, Transacao.cedula(usuarios, usuario), Transacao.valor())
        Financeiro.alternativas(usuarios, usuario)
      "3" -> 
        usuarios = Transacao.transferencia(usuarios, usuario)
        Financeiro.alternativas(usuarios, usuario)
      "4" -> Cambio.cambio_moeda(usuarios, usuario)
      _ ->
        IO.puts "Digite apenas 1, 2, 3 ou 4"
        alternativas(usuarios, usuario)
    end
  end
end
