defmodule Consulta do
  @moduledoc """
  Realiza consultas na estrutura de dados
  """

  @doc """
  Entra na estrutura de dados e obtem a atual quantia do usuário.

  ## Parâmetros

    - usuarios: Lista que representa a estrutura de dados.

    - usuario: Atom que representa o nome de usuário.

  ## Exemplo 
  
      iex> Consulta.verifica_saldo(usuarios, john)
      "[AED: 0, AFN: 0, ALL: 0, AMD: 0, ANG: 0, AOA: 0, ARS: 0, AUD: 0, AWG: 0, AZN: 0,
        BAM: 0, BBD: 0, BDT: 0, BGN: 0, BHD: 0, BIF: 0, BMD: 0, BND: 0, BOB: 0, BOV: 0,..."

  """
  def verifica_saldo(usuarios, usuario) do
    IO.puts usuarios[usuario] |> Enum.map_join("\n", fn {k, v} -> "#{k}:#{v}" end)
  end
end