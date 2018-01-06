
defmodule Critico do
  @moduledoc """
  Interrompe a execução do programa em casos de erros críticos.
  """

  @doc """
  Interrompe a execução do programa caso o usuário não exista.

  ## Exemplos

      iex> usuario_falha([john: [USD: 100], stone: [USD: 0]], :stone)
      :ok

      iex> usuario_falha([john: [USD: 100], stone: [USD: 0]], :Alan)

  """
  def usuario_falha(usuarios, usuario) do
    if Keyword.fetch(usuarios, usuario) == :error do
      System.stop(0)  
    end
  end

  @doc """
  Interrompe a execução do programa caso o dinheiro de uma transação não exista ou seja insuficiente.

  ## Exemplos

      iex> dinheiro_falha(23)
      :ok

      iex> dinheiro_falha(-100)

  """
  def dinheiro_falha(quantia) do
    unless quantia > 0 do
      IO.puts "Dinheiro insuficiente."
      System.stop(0) 
    end
  end
end
