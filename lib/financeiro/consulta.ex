defmodule Consulta do
  @moduledoc """
  Realiza consultas na estrutura de dados.
  """

  @doc """
  Entra na estrutura de dados e obtem a atual quantia de dinheiro do usuário.

  ## Parâmetros

    - usuarios: Lista que representa a estrutura de dados.

    - usuario: Atom que representa o nome de usuário.

  ## Exemplo 
  
      iex> Consulta.verifica_saldo(usuarios, john)
      AED:0
      AFN:0
      ALL:0
      ...

  """
  def verifica_saldo(usuarios, usuario) do
    IO.puts usuarios[usuario] |> Enum.map_join("\n", fn {k, v} -> "#{k}:#{v}" end)
  end

  @doc """
  É feita uma verificação na estrutura de dados para confirmar se o usuário existe.

  ## Exemplo

      iex> Consulta.verifica_usuario([john: 104, stone: 220], :rita)
      :error

      iex> Consulta.verifica_usuario([john: 233, stone: 10], :stone) 
      {:ok, 10}
      
  """
  def verifica_usuario(usuarios, usuario) do
    Keyword.fetch(usuarios, usuario) 
  end
end
