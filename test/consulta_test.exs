defmodule ConsultaTest do
  use ExUnit.Case

  test "quantia atual" do
    assert Consulta.verifica_saldo([john: [BRL: 100]], :john) == :ok
  end

  test "usuario não existe" do
    assert Consulta.usuario?([john: 104, stone: 220], :rita) == :error
  end

  test "usuario existe" do
    assert Consulta.usuario?([john: 233, stone: 10], :stone) == {:ok, 10}
  end
end
