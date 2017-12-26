defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "testa escolha do usuário" do
    um = " 1\n"
    dois = "2\n "
    tres = " 2\n "
    quatro = "1\n"
    assert String.trim(um) == "1"
    assert String.trim(dois) == "2"
    assert String.trim(tres) == "2"
    assert String.trim(quatro) == "1"
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

  test "adiciona" do
    usuario = [john: [USD: 0]]
    usuario = put_in (usuario[:john])[:USD],(usuario[:john])[:USD] + 10
    assert usuario == [john: [USD: 10]]
  end

  test "remove" do
    usuario = [john: [USD: 60]]
    usuario = put_in (usuario[:john])[:USD],(usuario[:john])[:USD] - 30
    assert usuario == [john: [USD: 30]]
  end

  test "transfere" do
    usuario = [john: [USD: 60], stone: [USD: 60]]
    usuario = put_in (usuario[:john])[:USD],(usuario[:john])[:USD] - 30
    usuario = put_in (usuario[:stone])[:USD],(usuario[:stone])[:USD] + 30
    assert usuario == [john: [USD: 30], stone: [USD: 90]]
  end 

  test "não possui dinheiro" do
    total = Keyword.values([BRL: 0, USD: 0])
    assert Enum.sum(total) <= 0
  end

  test "moeda com valor nulo" do
    assert Keyword.get([USD: 0], :USD) == 0
  end

  test "rateio" do
    usuarios = [john: [USD: 100], stone: [USD: 0], maria: [USD: 0]]
    split = round(100 / 10)
    usuarios = put_in (usuarios[:stone])[:USD],(usuarios[:stone])[:USD] + split
    assert usuarios == [john: [USD: 100], stone: [USD: 10], maria: [USD: 0]]
    quantia = 100 - split
    assert quantia == 90
  end
end