
defmodule Critico do
  @moduledoc """
  Interrompe a execução do programa em caso de erros críticos.
  """

  @doc """
  Interrompe a execução do programa caso o usuário não exista.

  """
  def usuario_falha(usuarios, usuario) do
    if Keyword.fetch(usuarios, usuario) == :error do
      System.stop(0)  
    end
  end

  @doc """
  Interrompe a execução do programa caso o dinheiro de uma transação não exista.

  """
  def dinheiro_falha(quantia) do
    unless quantia > 0 do
      IO.puts "Dinheiro insuficiente."
      System.stop(0) 
    end
  end
end