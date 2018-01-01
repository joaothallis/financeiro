defmodule ConsultaTest do
  use ExUnit.Case

  test "quantia atual" do
    assert Consulta.verifica_saldo([john: [BRL: 100]], :john) == :ok
  end
end