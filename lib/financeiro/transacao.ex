defmodule Transacao do
    @moduledoc """
    Forcene a função para fazer transferências monetárias entre contas.
  
    """
    @doc """
    Adiciona dinheiro a conta que está iniciada no sistema.

    """
    def cedula(usuarios, usuario) do
      moeda = IO.gets "Qual moeda? "
      moeda = String.upcase(moeda)
      moeda = Financeiro.string_atom(moeda)

      unless Keyword.get(usuarios[usuario], moeda) do
        IO.puts "Digite uma sigla válida."
        cedula(usuarios, usuario)
      end
      deposito(usuarios, usuario, moeda)
    end

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
      if quantia < 0 do
        IO.puts "Digite um valor positivo."
        deposito(usuario, usuario, moeda)
      end
      usuarios = put_in(usuarios[usuario])[moeda],(usuarios[usuario])[moeda] + quantia
      total = Keyword.get(usuarios[usuario], moeda)
      IO.puts "Seu saldo atual é de #{total} #{moeda}"
      Financeiro.alternativas(usuarios, usuario)
    end
end