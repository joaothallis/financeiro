# Financeiro

Estrutura de dados para realizar operações financeiras com [Elixir](http://elixir-lang.github.io/).

[![CircleCI](https://circleci.com/gh/joaothallis/financeiro.svg?style=svg)](https://circleci.com/gh/joaothallis/financeiro) [![codecov](https://codecov.io/gh/joaothallis/financeiro/branch/master/graph/badge.svg)](https://codecov.io/gh/joaothallis/financeiro)

## Requerimento

[Erlang](http://www.erlang.org/downloads)

## Como Começar

Clone o projeto ou faça [download](https://github.com/joaothallis/financeiro.git) dele:

```git
$ git clone https://github.com/joaothallis/financeiro.git
```

Entre na pasta:

```sh
$ cd financeiro
```

Execute o programa:

```
$ ./financeiro
```

## Como Utilizar

Entre com uma conta ou crie uma nova.
Ao criar uma conta, ela começa sem dinheiro. Para adicionar dinheiro realize um depósito, depois é possível realizar transferências e câmbio de moedas.

## Características

- O código da moeda deve ser sempre um código válido [ISO4217](https://www.iso.org/iso-4217-currency-codes.html).

- Os montantes de dinheiro são representados como `Integer`. Exemplo: `R$ 1,00` equivale a `100`.

- Todas as funções aritméticas trabalham em `Integer`, exceto no cálculo das taxas das moedas, onde trabalha com `Float`.

- As transações de dinheiro só podem ser executadas quando ambos os operandos são da mesma moeda.

- Por padrão a conta `stone` recebe a taxa de rateio.

- Todas moedas possem `1` de `taxa` de câmbio, exceto `AED`, `BRL`, `USD`.

### Lançamento principal

[1.0.0](https://github.com/joaothallis/financeiro/releases/tag/v1.0)  

### Status do Código

[![CircleCI](https://circleci.com/gh/joaothallis/financeiro.svg?style=svg)](https://circleci.com/gh/joaothallis/financeiro)

[![codecov](https://codecov.io/gh/joaothallis/financeiro/branch/master/graph/badge.svg)](https://codecov.io/gh/joaothallis/financeiro)

## Licensa
[MIT License](https://en.wikipedia.org/wiki/MIT_License)
