defmodule TransacaoTest do
  use ExUnit.Case
  
  test "valida moeda" do
    assert Transacao.ver_cedula(Financeiro.usr_padrao(), :john, :BRL) == :BRL
  end
  
  test "apenas números" do
    quantia = "23232142\n"
    quantia = String.trim(quantia)
    assert quantia = String.to_integer(quantia)
    assert quantia > 0
  end

  test "adiciona dinheiro" do
    usuario = [john: [USD: 0]]
    usuario = put_in (usuario[:john])[:USD],(usuario[:john])[:USD] + 10
    assert usuario == [john: [USD: 10]]
  end

  test "remove dinheiro" do
    usuario = [john: [USD: 60]]
    usuario = put_in (usuario[:john])[:USD],(usuario[:john])[:USD] - 30
    assert usuario == [john: [USD: 30]]
  end

  test "transfere dinheiro entre contas" do
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

  test "possui quantia" do
    assert Transacao.verifica_valor([john: [USD: 60]], :john, :USD, 10) == 10
  end

  test "rateio de valor" do
    assert Transacao.rateio(Financeiro.usr_padrao(), :AED, 100) == 90
  end
end