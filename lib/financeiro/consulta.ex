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
end
