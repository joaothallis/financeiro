defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "testa escolha do usuário" do
    escolha = IO.gets("Digite 1 ou 2\n")
    escolha = String.trim(escolha)
    assert escolha in ["1", "2"]
  end

  test "verifica se usuário existe" do
    usuarios = [
      john: 0,
      stone: 0,
      maria: 0
    ]
    resultado = Keyword.fetch!(usuarios, :john)
    assert resultado 
  end

  test "nome de usuário" do
    # Aceita apenas caracteres do alfabeto
    assert Regex.run(~r/^[a-zA-Z]+$/, "joao")
    assert Regex.run(~r/^[a-zA-Z]+$/, "donald")
  end

  test "remoção de \n" do
    assert String.trim("john\n") == "john";
    assert String.trim("john lennon\n") == "john lennon";
    assert String.trim("João.\n") == "João."
  end

  test "converte string para atom" do
    assert String.to_atom("john") == :john
  end

  test "apenas números" do
    quantia = "23232142\n"
    quantia = String.trim(quantia)
    assert quantia = String.to_integer(quantia)
    assert quantia > 0
  end
end