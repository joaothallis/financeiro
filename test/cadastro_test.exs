defmodule CadastroTest do
  use ExUnit.Case
  doctest Cadastro

  import ExUnit.CaptureIO

  test "nome existente" do
    result = "Escreva um nome de usuário: Esse nome de usuário já existe. Acesso realizado com sucesso.\n"
    assert capture_io([input: "john"], fn -> Cadastro.cria_usuario(Financeiro.usr_padrao()) end) == result
  end

  test "novo nome" do
    result = "Escreva um nome de usuário: Usuário visa criado com sucesso.\n"
    assert capture_io([input: "visa"], fn -> Cadastro.cria_usuario(Financeiro.usr_padrao()) end) == result
  end

  test "cria nova conta" do
    assert Cadastro.novo?(Financeiro.usr_padrao(), "jay") == :ok
  end

  test "conta já existente" do
    assert Cadastro.novo?(Financeiro.usr_padrao(), "john") == :ok
  end

  test "adiciona conta" do
    result = Keyword.put(Financeiro.usr_padrao(), :steve, Moeda.novo())
    assert Cadastro.add_conta(Financeiro.usr_padrao(), :steve) == result
  end

  test "aceita apenas letras" do
    # Aceita apenas caracteres do alfabeto
    assert Regex.run(~r/^[a-zA-Z]+$/, "Lucas") == ["Lucas"]
    refute Regex.run(~r/^[a-zA-Z]+$/, " donald^ ")
  end
end
