defmodule CambioTest do
  use ExUnit.Case
  doctest Cambio
  
  test "mesma moeda" do
    assert Cambio.moeda?(:USD, :USD) == :error
  end

  test "remove dinheiro" do
    usuarios = [bob: [USD: 60]]
    assert Cambio.remove_moeda(usuarios, :bob, :USD, 30) == [bob: [USD: 30]]
  end

  test "adiciona dinheiro" do
    usuarios = [stone: [BRL: 150]]
    assert Cambio.add_moeda(usuarios, :stone, :BRL, 100) == [stone: [BRL: 250]]
  end

  test "moeda invalida" do
    assert Cambio.moeda?(:AED, :AED) == :error
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

  test "converte moeda" do
    usuarios = [john: [BRL: 100, USD: 0]]
    result = [john: [BRL: 0, USD: 50]]
    assert Cambio.realiza_cambio(usuarios, :john, :BRL, :USD, 100) == result
  end
end
