defmodule Transacao do
  @moduledoc """
  Forcene a função para fazer transferências monetárias entre contas.
  """

  @doc """
  Verifica se o código da moeda é válido.

  """
  def cedula(usuarios, usuario, op) do
    moeda = IO.gets "Qual moeda? "
    moeda = String.upcase(moeda)
    moeda = Financeiro.string_atom(moeda)
    unless Keyword.get(usuarios[usuario], moeda) do
      IO.puts "Digite uma sigla válida."
      cedula(usuarios, usuario, op)
    end
    if op == "deposito" do
      deposito(usuarios, usuario, moeda)
    end
    moeda
  end

  @doc """
  Adiciona dinheiro a conta atual.

  """
  def deposito(usuarios, usuario, moeda) do
    quantia = IO.gets "Quanto deseja depositar? "
    quantia = String.trim(quantia)
    case Integer.parse(quantia) do
      {_num, ""} -> :ok
      _ -> 
        IO.puts "Digite apenas números."
        deposito(usuarios, usuario, moeda)
    end
    quantia = String.to_integer(quantia)
    if quantia <= 0 do
      IO.puts "Digite um valor positivo."
      deposito(usuarios, usuario, moeda)
    end
      usuarios = put_in (usuarios[usuario])[moeda],(usuarios[usuario])[moeda] + quantia
      total = Keyword.get(usuarios[usuario], moeda)
      IO.puts "Seu saldo atual é de #{total} #{moeda}"
      Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Realiza transferência de dinheiro entre contas do sistema.

  """
  def transferencia(usuarios, usuario, moeda) do
    total = Keyword.values(usuarios[usuario])
    if Enum.sum(total) <= 0 do
      IO.puts "Você não possui dinheiro, faça um deposito antes de continuar"
      Financeiro.alternativas(usuarios, usuario)
    end
    referido = IO.gets "Para qual conta deseja realizar a transferência: "
    referido = Financeiro.string_atom(referido)
    if referido == usuario do
      IO.puts "Você não pode realizar transferência para sua conta. Para adicionar dinheiro a sua conta realize um deposito."
      Financeiro.alternativas(usuarios, usuario)
    end
    case Keyword.fetch(usuarios, referido) do
      :error ->
        IO.puts "Essa conta não existe."
        transferencia(usuarios, usuario, moeda)
      _ -> :ok
    end
    op = "transferencia"
    moeda = cedula(usuarios, usuario, op)
    if Keyword.get(usuarios[usuario], moeda) <= 0 do
      IO.puts "Você não possui quantia com essa moeda, faça um deposito antes de continuar."
      Financeiro.alternativas(usuarios, usuario)
    end
    quantia = valor()
    # Remove
    usuarios = put_in (usuarios[usuario])[moeda],(usuarios[usuario])[moeda] - quantia
    quantia = rateio(usuarios, moeda, quantia)
    # Adiciona
    usuarios = put_in (usuarios[referido])[moeda],(usuarios[referido])[moeda] + quantia
    # Para verificar descomente as duas linhas abaixo
    # referido = Keyword.get(usuarios[referido], moeda)
    # IO.inspect referido
    Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Valida entrada do usuário para aceitar apenas números inteiros positivos.

  """
  def valor do
    quantia = IO.gets "Quanto deseja transferir? "
    quantia = String.trim(quantia)
    case Integer.parse(quantia) do
      {_num, ""} -> :ok
      _ -> 
        IO.puts "Digite apenas números."
        valor()
    end
    quantia = String.to_integer(quantia)
    if quantia <= 0 do
      IO.puts "Digite um valor positivo."
      valor()
    end
    quantia
  end

  def rateio(usuarios, moeda, quantia) do
    taxa = 10
    split = round(quantia / taxa)
    usuarios = put_in (usuarios[:stone])[moeda],(usuarios[:stone])[moeda] + split
    quantia = quantia - split 
  end
end