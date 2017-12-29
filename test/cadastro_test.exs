defmodule CadastroTest do
  use ExUnit.Case
  
  test "apenas letras" do
    # Aceita apenas caracteres do alfabeto
    assert Regex.run(~r/^[a-zA-Z]+$/, "Lucas")
    refute Regex.run(~r/^[a-zA-Z]+$/, " donald^ ")
  end
end