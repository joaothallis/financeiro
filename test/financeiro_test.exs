defmodule FinanceiroTest do
  use ExUnit.Case

  test "verifica se usuário existe" do
    usuarios = [
      john: 0,
      stone: 0,
      maria: 0
    ]
    assert Keyword.fetch(usuarios, :john) == {:ok, 0}
  end

  test "remove espaço vazio e transforma em atom" do
    assert Financeiro.string_atom("john \n") == :john
  end
end
