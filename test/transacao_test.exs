defmodule TransacaoTest do
  use ExUnit.Case
  
  test "valida moeda" do
    assert Transacao.ver_cedula(Financeiro.usr_padrao(), :john, :BRL) == :BRL
  end
  
  test "apenas números" do
    quantia = "23232142\n"
    quantia = String.trim(quantia)
    assert quantia = String.to_integer(quantia)
  end

  test "transfere dinheiro entre contas sem rateio" do
    usuarios = [bob: [USD: 60], stone: [USD: 60]]
    result = [bob: [USD: 30], stone: [USD: 90]] 
    assert Transacao.realiza_transferencia(usuarios, :bob, :USD, 30, :stone) == result
  end 

  test "transfere dinheiro entre contas com rateio" do
    usuarios = [bob: [USD: 100], john: [USD: 0], stone: [USD: 0]]
    result = [bob: [USD: 0], john: [USD: 90], stone: [USD: 10]] 
    assert Transacao.realiza_transferencia(usuarios, :bob, :USD, 100, :john) == result
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
    usuarios = [john: [USD: 100], stone: [USD: 0]]
    result = [90, [john: [USD: 100], stone: [USD: 10]]]
    assert Transacao.rateio(usuarios, :USD, 100) == result
  end

  test "converte para maiúsculo e em atom" do
    assert Transacao.up_atom("blr") == :BLR
  end 
end
