defmodule Transacao do
  @moduledoc """
  Forcene a função para efetuar transferências monetárias entre contas.
  """

  @doc """
  Transforma a entrada do usuário para verificar o código da moeda.

  """
  def cedula(usuarios, usuario) do
    moeda = Financeiro.entrada("Qual moeda? ")
    moeda = up_atom(moeda)
    ver_cedula(usuarios, usuario, moeda)
  end

  @doc """
  Converte para `Atom` e todos os caracteres para maiúsculo.

  """
  def up_atom(moeda) do
    moeda |> String.upcase() |> Financeiro.string_atom()
  end

  @doc """
  Verifica se a variável moeda é uma sigla válida de moeda.

  ## Parâmetros

    - moeda: Atom que representa as siglas de uma moeda.

  ## Exemplo

      iex> Transacao.ver_cedula(Financeiro.usr_padrao(), :john, :BRL)
      :BRL

      iex> Transacao.ver_cedula(Financeiro.usr_padrao(), :stone, :USD)
      :USD
  
  """
  def ver_cedula(usuarios, usuario, moeda) do
    if Keyword.get(usuarios[usuario], moeda) do
      moeda
    else
      IO.puts "Digite uma sigla válida."
      cedula(usuarios, usuario)
    end
  end

  @doc """
  Adiciona dinheiro a conta.

  """
  def deposito(usuarios, usuario, moeda, quantia) do
    usuarios = put_in (usuarios[usuario])[moeda], (usuarios[usuario])[moeda] + quantia
    total = Keyword.get(usuarios[usuario], moeda)
    IO.puts "Seu saldo atual é de #{total} #{moeda}"
    usuarios
  end

  @doc """
  Verifica se o usuário possui algum dinheiro em sua conta.

  ## Exemplo
(
    - iex> Transacao.dinheiro?([bob: [USD: 0]], :bob)
      :error
    
    - iex> Transacao.dinheiro?([marceline: [AED: 550]], :marceline)
      nil

  """
  def dinheiro?(usuarios, usuario) do
    total = Keyword.values(usuarios[usuario])
    if Enum.sum(total) <= 0 do
      IO.puts "Você não possui dinheiro, faça um deposito antes de continuar"
      :error
    end
  end

  @doc """
  Obtém as entradas necessárias para realiza transferência de dinheiro entre contas do sistema.

  """
  def transferencia(usuarios, usuario) do
    referido = relativo(usuarios, usuario)
    moeda = cedula(usuarios, usuario)
    moeda_nulo(usuarios, usuario, moeda)
    quantia = valor()
    realiza_transferencia(usuarios, usuario, moeda, quantia, referido)
  end

  @doc """
  Verifica se possui alguma quantia de dinheiro na moeda passada como parâmetro.

  """
  def moeda_nulo(usuarios, usuario, moeda) do
    if Keyword.get(usuarios[usuario], moeda) <= 0 do
      IO.puts "Você não possui quantia com essa moeda, faça um deposito antes de continuar."
      Financeiro.alternativas(usuarios, usuario)
    end
  end

  @doc """
  Verifica se é válida a conta que vai receber a transferência.
  
  """
  def relativo(usuarios, usuario) do
    if dinheiro?(usuarios, usuario) == :error do
      Financeiro.alternativas(usuarios, usuario)
    end
    referido = Financeiro.entrada("Para qual conta deseja realizar a transferência? ")
    referido = Financeiro.string_atom(referido)
    if referido == usuario do
      IO.puts "Você não pode realizar transferência para sua conta. Para adicionar dinheiro a sua conta realize um deposito."
      Financeiro.alternativas(usuarios, usuario)
    end
    case Consulta.usuario?(usuarios, referido) do
      :error ->
        IO.puts "Essa conta não existe."
        transferencia(usuarios, usuario)
      _ -> referido
    end
  end

  @doc """
  Realiza transferência de dinheiro entre contas.

  ## Parâmetro

      - referido: conta que recebe a transferência financeira.
  
  """
  def realiza_transferencia(usuarios, usuario, moeda, quantia, referido) do
    verifica_valor(usuarios, usuario, moeda, quantia)
    usuarios = Cambio.remove_moeda(usuarios, usuario, moeda, quantia)
    [quantia, usuarios] =
      if referido != :stone do
        rateio(usuarios, moeda, quantia)
      else
        [quantia, usuarios]
      end
    IO.puts "Você transferiu #{quantia} #{moeda} para #{referido}."
    Cambio.add_moeda(usuarios, referido, moeda, quantia)
  end

  @doc """
  Valida a entrada do usuário para aceitar apenas números inteiros positivos.

  """
  def valor do
    quantia = Financeiro.entrada("Quantia: ")
    case Regex.run(~r/^(0*[1-9][0-9]*)$/, quantia) do
      nil ->
        IO.puts "Digite apenas números positivos."
        valor()
      _ -> String.to_integer(quantia)
    end
  end

  @doc """
  Verifica se o usuário possui o dinheiro que deseja transferir.

  ## Exemplo

    iex> Transacao.verifica_valor([john: [USD: 60]], :john, :USD, 10) 
    10

  """
  def verifica_valor(usuarios, usuario, moeda, quantia) do
    if Keyword.get(usuarios[usuario], moeda) < quantia do
      IO.puts "Você não possui essa quantia, faça um deposito antes de continuar."
      Financeiro.alternativas(usuarios, usuario)
    end
    quantia
  end

  @doc """
  Realiza a operação de rateio de valores.

  Por padrão :stone quem recebe parte da divisão.

  ## Exemplo

    iex> Transacao.rateio([john: [USD: 100], stone: [USD: 0]], :USD, 100) 
    [90, [john: [USD: 100], stone: [USD: 10]]]

  """
  def rateio(usuarios, moeda, quantia) do
    taxa = 10
    split = round(quantia / taxa)
    usuarios = put_in (usuarios[:stone])[moeda], (usuarios[:stone])[moeda] + split
    IO.write "Taxa de rateio de #{taxa}% para stone. "
    [quantia - split, usuarios]
  end
end
