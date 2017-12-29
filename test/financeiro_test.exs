defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

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

  test "remove espaços e transforma em atom" do
    assert Financeiro.string_atom("john \n") == :john
  end
end