defmodule FinanceiroTest do
  use ExUnit.Case
  doctest Financeiro

  test "digitou 1 ou 2" do
    escolha = IO.gets("Digite 1 ou 2\n")
    escolha = String.trim(escolha)
    assert escolha in ["1", "2"]
  end
end
