defmodule FinanceiroTest do
  use ExUnit.Case

  test "1 ou 2" do
    assert String.trim(" 1\n") == "1"
    assert String.trim("2\n ") == "2"
    assert String.trim(" 2\n ") == "2"
    assert String.trim("\n1") == "1"
    escolha = String.trim(" \n")
    refute escolha == "1" or escolha == "2" 
    escolha = String.trim("01\n")
    refute escolha == "1" or escolha == "2" 
    escolha = String.trim("0.1\n")
    refute escolha == "1" or escolha == "2" 
    escolha = String.trim("joão\n")
    refute escolha == "1" or escolha == "2" 
  end

  test "verifica se usuário existe" do
    usuarios = [
      john: 0,
      stone: 0,
      maria: 0
    ]
    assert Keyword.fetch(usuarios, :john)
    assert Keyword.fetch(usuarios, :google) == :error
  end

  test "remoção de \n e espaços antes e depois" do
    assert String.trim(" Elixir\n ") == "Elixir";
    assert String.trim("john lennon \n") == "john lennon";
    assert String.trim("João.\n ") == "João."
    assert String.trim("\n 24726021") == "24726021"
  end

  test "converte string para atom" do
    assert String.trim("john") |> String.to_atom() == :john
    assert String.trim(" Elixir ") |> String.to_atom() == :Elixir
    assert String.trim("Agente007") |> String.to_atom() == :Agente007
    refute String.trim(" 020 ") |> String.to_atom() == :error
    refute String.trim("~.;") |> String.to_atom() == :error
    refute String.trim("") |> String.to_atom() == :vazio
    refute String.trim(" ") |> String.to_atom() == :vazio
    refute String.trim("joh n ") |> String.to_atom() == :john
  end
end