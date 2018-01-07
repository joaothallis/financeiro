defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  import ExUnit.CaptureIO

  test "escolhe 1" do
    assert capture_io([input: "1\n"], fn -> Financeiro.entrada("1") end) == "1"
  end

  test "remove espaço vazio e transforma em atom" do
    assert Financeiro.string_atom("john \n") == :john
  end
end
