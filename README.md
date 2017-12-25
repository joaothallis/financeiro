# Financeiro

Estrutura de dados para realizar operações financeiras com [Elixir](http://elixir-lang.github.io/).

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

- Todas as funções aritméticas trabalham em `Integer`.

- As transações de dinheiro só podem ser executadas quando ambos os operandos são da mesma moeda.

### Status do Código

#### Integração Contínua

[Semaphoreci](https://semaphoreci.com/joaothallis/financeiro)

## Licensa
[MIT License](https://en.wikipedia.org/wiki/MIT_License)