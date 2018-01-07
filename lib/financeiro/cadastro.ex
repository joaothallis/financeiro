defmodule Cadastro do
  @moduledoc """
  Módulo para criar contas no sistema.
  """

  @doc """
  Cria uma nova conta na estrutura de dados.

  A nova conta de usuário recebe uma lista com todas as moedas contendo o valor: 0.

  """
  def cria_usuario(usuarios) do
    usuario = IO.gets "Escreva um nome de usuário: "
    if Regex.run(~r/^[a-zA-Z]+$/, usuario) == nil do
      IO.puts "Digite apenas letras."
      cria_usuario(usuarios)
    else
      result_criar(usuarios, usuario)
    end    
  end

  @doc """
  Converte nome de usuário para atom e cria uma nova conta de usuário no sistema.

  Se o nome de usuário constar na estrutura de dados, será feito um acesso no sistema.

  ## Exemplo

      iex> Cadastro.result_criar(Financeiro.usr_padrao(), "leila") 
      :ok
     
  """
  def result_criar(usuarios, usuario) do
    usuario = Financeiro.string_atom(usuario)
      case Consulta.usuario?(usuarios, usuario) do
        :error -> IO.puts "Usuário #{usuario} criado com sucesso."
        _ -> IO.puts "Esse nome de usuário já existe. Acesso realizado com sucesso."
      end
  end

  @doc """
  Adiciona a nova conta a estrutura de dados.

  """
  def add_conta(usuarios, usuario) do
    Keyword.put(usuarios, usuario, Moeda.novo())
  end
end
