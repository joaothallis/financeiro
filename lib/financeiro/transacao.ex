defmodule Transacao do
  @moduledoc """
  Forcene a função para efetuar transferências monetárias entre contas.
  """

  @doc """
  Transforma a entrada do usuário para verificar o código da moeda.

  """
  def cedula(usuarios, usuario) do
    moeda = IO.gets "Qual moeda? "
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
  Adiciona dinheiro a conta atual.

  """
  def deposito(usuarios, usuario) do
    moeda = cedula(usuarios, usuario)
    quantia = IO.gets "Quanto deseja depositar? "
    quantia = String.trim(quantia)
    case Integer.parse(quantia) do
      {_num, ""} -> :ok
      _ ->
        IO.puts "Digite apenas números."
        deposito(usuarios, usuario)
    end
    quantia = String.to_integer(quantia)
    if quantia <= 0 do
      IO.puts "Digite um valor positivo."
      deposito(usuarios, usuario)
    end
      usuarios = put_in (usuarios[usuario])[moeda], (usuarios[usuario])[moeda] + quantia
      total = Keyword.get(usuarios[usuario], moeda)
      IO.puts "Seu saldo atual é de #{total} #{moeda}"
      Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Verifica se o usuário possui algum dinheiro em sua conta.

  ## Exemplo

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
    if dinheiro?(usuarios, usuario) == :error do
      Financeiro.alternativas(usuarios, usuario)
    end
    referido = IO.gets "Para qual conta deseja realizar a transferência: "
    referido = Financeiro.string_atom(referido)
    if referido == usuario do
      IO.puts "Você não pode realizar transferência para sua conta. Para adicionar dinheiro a sua conta realize um deposito."
      Financeiro.alternativas(usuarios, usuario)
    end
    case Consulta.usuario?(usuarios, referido) do
      :error ->
        IO.puts "Essa conta não existe."
        transferencia(usuarios, usuario)
      _ -> :ok
    end
    moeda = cedula(usuarios, usuario)
    if Keyword.get(usuarios[usuario], moeda) <= 0 do
      IO.puts "Você não possui quantia com essa moeda, faça um deposito antes de continuar."
      Financeiro.alternativas(usuarios, usuario)
    end
    quantia = valor()
    usuarios = realiza_transferencia(usuarios, usuario, moeda, quantia, referido)
    # Para verificar descomente a linha abaixo
    # IO.inspect(usuarios, limit: :infinity)
    Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Realiza transferência de dinheiro entre contas.
  
  """
  def realiza_transferencia(usuarios, usuario, moeda, quantia, referido) do
    verifica_valor(usuarios, usuario, moeda, quantia)
    usuarios = Cambio.remove_moeda(usuarios, usuario, moeda, quantia)
    if referido != :stone do
      [quantia, usuarios] = rateio(usuarios, moeda, quantia)
    else
      quantia
    end
    IO.puts "Você transferiu #{quantia} #{moeda} para #{referido}."
    Cambio.add_moeda(usuarios, referido, moeda, quantia)
  end

  @doc """
  Valida entrada do usuário para aceitar apenas números inteiros positivos.

  """
  def valor do
    case quantia = Regex.run(~r/^(0*[1-9][0-9]*)$/, IO.gets "Quantia: ") do
      nil ->
        IO.puts "Digite apenas números."
        valor()
      _ ->
        [quantia, _] = quantia
        String.to_integer(quantia)
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
