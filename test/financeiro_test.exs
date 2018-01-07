defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "remove espaço vazio e transforma em atom" do
    assert Financeiro.string_atom("john \n") == :john
  end
end
