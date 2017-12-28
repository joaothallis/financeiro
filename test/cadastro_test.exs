defmodule CadastroTest do
  use ExUnit.Case
  
  test "nome de usuário" do
    # Aceita apenas caracteres do alfabeto
    assert Regex.run(~r/^[a-zA-Z]+$/, "joao")
    assert Regex.run(~r/^[a-zA-Z]+$/, "donald")
    refute Regex.run(~r/^[a-zA-Z]+$/, " donald ")
  end
end