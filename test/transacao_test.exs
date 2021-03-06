defmodule TransacaoTest do
  use ExUnit.Case
  doctest Transacao

  import ExUnit.CaptureIO

  test "captura moeda" do
    assert capture_io([input: "AED"], fn -> Transacao.cedula(Financeiro.usr_padrao(), :john) end) == "Qual moeda? "
  end

  test "moeda válida" do
    assert Transacao.ver_cedula(Financeiro.usr_padrao(), :john, :BRL) == :BRL
  end

  test "moeda inválida" do
    assert capture_io([input: "BRL"], fn -> Transacao.ver_cedula(Financeiro.usr_padrao(), :john, :XYZ) end) == "Digite uma sigla válida.\nQual moeda? "
  end

  test "string para inteiro" do
    assert "23232142\n" |> String.trim() |> String.to_integer() == 23_232_142
  end

  test "deposita dinheiro" do
    assert Transacao.deposito(Financeiro.usr_padrao(), :maria, :AED, 250_000)
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
    assert Transacao.dinheiro?([alan: [USD: 0]], :alan) == :error
  end

  test "possui dinheiro" do
    assert Transacao.dinheiro?([steve: [BRL: 1150]], :steve) != :error
  end

  test "moeda com quantia" do
    assert Transacao.moeda_nulo([jon: [USD: 500]], :jon, :USD) == nil
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
