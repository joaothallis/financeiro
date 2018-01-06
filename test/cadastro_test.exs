defmodule CadastroTest do
  use ExUnit.Case
  doctest Cadastro

  test "cria nova conta" do
    estrutura = Keyword.put(Financeiro.usr_padrao(), :jay, Moeda.novo())
    assert Cadastro.result_criar(Financeiro.usr_padrao(), "jay") == [estrutura, :jay]
  end

  test "conta já existente" do
    assert Cadastro.result_criar(Financeiro.usr_padrao(), "john") == [Financeiro.usr_padrao(), :john]  
  end
  
  test "aceita apenas letras" do
    # Aceita apenas caracteres do alfabeto
    assert Regex.run(~r/^[a-zA-Z]+$/, "Lucas")
    refute Regex.run(~r/^[a-zA-Z]+$/, " donald^ ")
  end
end
