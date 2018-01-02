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

  test "transfere dinheiro entre contas sem rateio" do
    assert Transacao.realiza_transferencia([jake: [USD: 60], stone: [USD: 60]], :jake, :USD, 30, :stone) == [jake: [USD: 30], stone: [USD: 90]] 
  end 

  test "transfere dinheiro entre contas com rateio" do
    assert Transacao.realiza_transferencia([bob: [USD: 100], john: [USD: 0], stone: [USD: 0]], :bob, :USD, 100, :john) == [bob: [USD: 0], john: [USD: 90], stone: [USD: 10]] 
  end

  test "não possui dinheiro" do
    assert Transacao.possui_dinheiro(Financeiro.usr_padrao(), :john) == :error
  end

  test "moeda com valor nulo" do
    assert Keyword.get([USD: 0], :USD) == 0
  end

  test "possui quantia" do
    assert Transacao.verifica_valor([john: [USD: 60]], :john, :USD, 10) == 10
  end

  test "rateio de valor" do
    assert Transacao.rateio([john: [USD: 100], stone: [USD: 0]], :USD, 100) == [90, [john: [USD: 100], stone: [USD: 10]]]
  end

  test "converte para maiúsculo e em atom" do
    assert Transacao.up_atom("blr") == :BLR
  end 
end