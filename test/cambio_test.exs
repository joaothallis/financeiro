defmodule CambioTest do
  use ExUnit.Case
  
  test "mesma moeda" do
    assert Cambio.valida_moeda(:USD, :USD) == :error
  end

  test "remove dinheiro" do
    assert Cambio.remove_moeda([john: [USD: 60]], :john, :USD, 30) == [john: [USD: 30]]
  end

  test "adiciona dinheiro" do
    assert Cambio.add_moeda([stone: [BRL: 150]], :stone, :BRL, 1000) == [stone: [BRL: 1150]]
  end

  test "moeda invalida" do
    assert Cambio.valida_moeda(:AED, :AED) == :error
  end

  test "obtém peso" do
    assert Cambio.obtem_peso(:JPY) == 1
  end

  test "calcula taxa" do
    assert Cambio.taxa(10, 5) == 2
  end

  test "retorno no câmbio" do
    assert Cambio.calc_retorno(5, 2, 100) === 250
  end

  test "realiza cambio" do
    assert Cambio.realiza_cambio([john: [BRL: 100, USD: 0]], :john, :BRL, :USD, 100, 5) == [john: [BRL: 0, USD: 50]]
  end
end