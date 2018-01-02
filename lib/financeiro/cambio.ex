defmodule Cambio do
  @moduledoc """
  Realiza câmbio de moedas.
  """

  @doc """
  Obtém e verifica a entrada do usuário para a realização de troca de moeda.

  """
  def cambio_moeda(usuarios, usuario) do
    if Transacao.possui_dinheiro(usuarios, usuario) == :error do
      Financeiro.alternativas(usuarios, usuario)
    end
    entrada = Transacao.cedula(usuarios, usuario)
    IO.write "Primeira moeda: #{entrada}. "
    quantia = Transacao.valor()
    Transacao.verifica_valor(usuarios, usuario, entrada, quantia)
    saida = Transacao.cedula(usuarios, usuario)
    if valida_moeda(entrada, saida) == :error do
      IO.puts "Não é possível realizar câmbio para a mesma moeda. Digite as moedas novamente."
      cambio_moeda(usuarios, usuario)
    end
    usuarios = realiza_cambio(usuarios, usuario, entrada, saida, quantia)
    Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Realiza a troca de moeda.

  ## Parâmetros

    - entrada: Atom que representa a moeda que deseja trocar.

    - saida: Atom que representa a moeda que deseja receber na troca.

    - quantia: Quantia que deseja trocar.

  ## Exemplos

      iex> Cambio.realiza_cambio([john: [BRL: 0, USD: 100]], :john, :USD, :BRL, 100)
      [john: [BRL: 200, USD: 0]]

      iex> Cambio.realiza_cambio([stone: [AED: 10, IRR: 0]], :john, :AED, :IRR, 10)
      [stone: [AED: 0, IRR: 10]]
  
  """
  def realiza_cambio(usuarios, usuario, entrada, saida, quantia) do
    peso_entrada = obtem_peso(entrada)
    IO.puts "Segunda moeda: #{saida}."
    peso_saida = obtem_peso(saida)
    taxa(peso_entrada, peso_saida)
    usuarios = remove_moeda(usuarios, usuario, entrada, quantia)
    quantia_nova = calc_retorno(peso_entrada, peso_saida, quantia)
    add_moeda(usuarios, usuario, saida, quantia_nova)
  end

  @doc """
  Remove dinheiro de uma determinada moeda.

  ## Exemplos

      iex> Cambio.remove_moeda([maria: [USD: 100]], :maria, :USD, 50)
      [maria: [USD: 50]]

      iex> Cambio.remove_moeda([stone: [BRL: 200]], :stone, :USD, 28)
      [stone: [USD: 172]]

  """
  def remove_moeda(usuarios, usuario, entrada, quantia) do
    put_in (usuarios[usuario])[entrada], (usuarios[usuario])[entrada] - quantia
  end

  @doc """
  Adiciona dinheiro em uma determinada moeda.

  ## Exemplos

      iex> Cambio.add_moeda([maria: [USD: 100]], :maria, :USD, 50)
      [maria: [USD: 150]]

      iex> Cambio.add_moeda([stone: [BRL: 200]], :stone, :USD, 28)
      [stone: [USD: 228]]

  """
  def add_moeda(usuarios, usuario, saida, quantia_nova) do
    Critico.dinheiro_falha(quantia_nova)
    put_in (usuarios[usuario])[saida], (usuarios[usuario])[saida] + quantia_nova
  end

  @doc """
  Verifica se as moedas são iguais.

  ## Parâmetros

    - entrada: Atom que representa a primeira moeda.

    - saida: Atom que representa a segunda moeda.

  ## Exemplo

      iex> Cambio.valida_moeda(:USD, :USD)
      :error

  """
  def valida_moeda(entrada, saida) do
    if entrada == saida do
      :error
    end
  end

  @doc """
  Obtém o peso da moeda.

  ## Exemplos

      iex> Cambio.obtem_peso(:KGS)
      1

      iex> Cambio.obtem_peso(:USD)
      5

  """
  def obtem_peso(moeda) do
    Moeda.info()[moeda].peso
  end

  @doc """
  Realiza divisão com o peso das moedas.

  ## Parâmetros

    - peso_entrada: Peso da moeda de entrada.

    - peso_saida: Peso da moeda de saída.

  ## Exemplos

      iex> Cambio.taxa(15, 5) 
      3

      iex> Cambio.taxa(1, 10)
      0.1

  """
  def taxa(peso_entrada, peso_saida) do
    peso_entrada / peso_saida 
  end

  @doc """
  Realiza o calculo para saber qual a quantia que deve retornar para a moeda de saída.

  ## Exemplos

      iex> Cambio.calc_retorno(1, 10, 100)
      10

      iex> Cambio.calc_retorno(5, 1, 23) 
      115 

  """
  def calc_retorno(peso_entrada, peso_saida, quantia) do
    trunc(taxa(peso_entrada, peso_saida) * quantia)
  end
end
