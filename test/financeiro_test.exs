defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  import ExUnit.CaptureIO

  test "escolhe 1" do
    assert capture_io([input: "1"], fn -> Financeiro.entrada("Digite:") end) == "Digite:"
  end

  test "remove espaço vazio e transforma em atom" do
    assert Financeiro.string_atom("john \n") == :john
  end

  test "acessa o sistema" do
    assert capture_io([input: "john"], fn -> Financeiro.acessar(Financeiro.usr_padrao(), :ok) end)
  end
end
