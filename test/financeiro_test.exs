defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "testa escolha do usuário" do
    assert String.trim(" 1\n") == "1"
    assert String.trim("2\n ") == "2"
    assert String.trim(" 2\n ") == "2"
    assert String.trim("1\n") == "1"
    escolha = ""
    refute escolha == "1" or escolha == "2" 
    escolha = "01"
    refute escolha == "1" or escolha == "2" 
    escolha = "0.1"
    refute escolha == "1" or escolha == "2" 
    escolha = "joão"
    refute escolha == "1" or escolha == "2" 
  end

  test "verifica se usuário existe" do
    usuarios = [
      john: 0,
      stone: 0,
      maria: 0
    ]
    assert Keyword.fetch!(usuarios, :john)
  end

  test "remoção de \n" do
    assert String.trim("john\n") == "john";
    assert String.trim("john lennon\n") == "john lennon";
    assert String.trim("João.\n") == "João."
  end

  test "converte string para atom" do
    assert String.to_atom("john") == :john
  end
end