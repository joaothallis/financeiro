defmodule Cadastro do
  @moduledoc """
  Forcene a função para criar novos usuários.
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
    usuario = Financeiro.string_atom(usuario)
    case Keyword.fetch(usuarios, usuario) do
      :error ->
        usuarios = Keyword.put(usuarios, usuario, Moeda.novo())
        IO.puts "Usuário #{usuario} criado com sucesso."
        Financeiro.alternativas(usuarios, usuario)
      _ ->
        IO.puts "Esse nome de usuário já existe."
        cria_usuario(usuarios)
    end
  end
