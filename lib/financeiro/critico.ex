
defmodule Critico do
  @moduledoc """
  Interrompe a execução do programa em casos de erros críticos.
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
  Interrompe a execução do programa caso o dinheiro de uma transação não exista ou seja insuficiente para realiza-la.

  """
  def dinheiro_falha(quantia) do
    unless quantia > 0 do
      IO.puts "Dinheiro insuficiente."
      System.stop(0) 
    end
  end
end
