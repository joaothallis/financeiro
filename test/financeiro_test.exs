defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "digitou 1 ou 2" do
    escolha = IO.gets("Digite 1 ou 2\n")
    escolha = String.trim(escolha)
    assert escolha in ["1", "2"]
  end

  test "converte string para atom" do
    assert String.to_atom("john") == :john;
  end
end
