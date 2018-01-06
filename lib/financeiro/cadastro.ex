defmodule Cadastro do
  @moduledoc """
  Módulo para criar novos usuários.
  """

  @doc """
  Cria um novo usuário para a estrutura de dados.

  Novo usuário recebe uma lista com todas as moedas contendo o valor: 0.

  """
  def cria_usuario(usuarios) do
    case usuario = Regex.run(~r/^[a-zA-Z]+$/, IO.gets "Escreva um nome de usuário: ") do
      nil -> 
        IO.puts "Digite apenas letras."
        cria_usuario(usuarios)
      _ -> [usuario] = usuario
    end
    [usuarios, usuario] = result_criar(usuarios, usuario)
    Financeiro.alternativas(usuarios, usuario)
  end

  @doc """
  Converte nome de usuário para atom e cria um novo usuário no sistema.

  Se o nome de usuário de usuário já existir na estrutura de dados, será feito um acesso no sistema.

  ## Exemplo

      iex> Cadastro.result_criar(Financeiro.usr_padrao(), "john") 
      [Financeiro.usr_padrao(), :john]  
     
  """
  def result_criar(usuarios, usuario) do
    usuario = Financeiro.string_atom(usuario)
      case Consulta.usuario?(usuarios, usuario) do
        :error ->
          IO.puts "Usuário #{usuario} criado com sucesso."
          usuarios = Keyword.put(usuarios, usuario, Moeda.novo())
          [usuarios, usuario]
        _ ->
          IO.puts "Esse nome de usuário já existe. Acesso realizado com sucesso."
          [usuarios, usuario]
      end
  end
end
