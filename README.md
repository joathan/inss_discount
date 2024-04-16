# README

## Passos para rodar o projeto:

- Clonar o repositório:
```bash
git clone git@github.com:joathan/inss_discount.git
```
  
- Copiar o arquivo .env.template para .env
```bash
cp .env.template .env
```

- Rodar o docker compose:
```bash
docker compose up -d
```

- Para criar dados iniciais:
```bash
docker compose run --rm inss bundle exec rails db:seed
```

- Para acessar a aplicação:
```bash
http://localhost:8020

# Usuario padrão para login
Usuário: admin@inss.com.br
Senha: 123123
```

## Comandos úteis

- Para acessar o container:
```bash
docker compose exec inss bash
```

- Para rodar o rubocop:
```bash
docker compose run --rm inss bundle exec rubocop
```

- Para rodar os testes:
```bash
docker compose run --rm inss bundle exec rspec
```


## Sobre

### Desafio
Criar uma aplicação "Desconto INSS" no Rails com os seguintes requisitos:

- Rails 5+;
- PostgreSQL;
- Bootstrap;
- Chart.js;
- Rubocop rails;
- Kaminari;
- Redis;
- Sidekiq.

### Especificação funcional
1. Cadastro de proponente(CRUD)
Nome,  CPF,  Data de nascimento, endereço(logradouro, número, bairro, cidade, estado, CEP), telefones para contato(pessoais, referências), salário.
A listagem dos proponentes deve ser utilizada paginação, exibindo apenas 5 resultados por página.

2. Calculo de desconto de INSS
No formulário de cadastro do proponente, ao ser informado o valor do salário deve ser feita uma requisição ajax(XHR), que deverá retornar o valor do desconto do INSS. Esse valor deve ser exibido no formulário e registrado no cadastro.

3. Relatório dos funcionários
Deve ser criado um relatório para exibir os funcionários agrupando-os por faixas salariais, exibindo quantos funcionários existem em cada faixa salarial, seguindo as faixas:

- Até R$ 1.045,00
- De R$ 1.045,01 a R$ 2.089,60
- De R$ 2.089,61 até R$ 3.134,40
- De R$ 3.134,41 até R$ 6.101,06

Importante: O relatório deve exibir as informações em listagem assim como em gráfico.

### Como calcular passo a passo:

- Para salários até R$ 1.100,00, o desconto é de 7,5%
- Para salários de R$ 1.100,01 até R$ 2.203,48, o desconto é de 9%
- Para salários de R$ 2.203,49 até R$ 3.305,22, o desconto é de 12%
- Para salários de R$ 3.305,23 até R$ 6.433,57, o desconto é de 14%
- Para salários acima de R$ 6.433,57, o desconto é de R$ 751,99

Ex.:

- 1ª faixa salarial: 1.045,00 x 0,075 = 78,37
- 2ª faixa salarial: [2.089,60 - 1.045,00] x 0,09 = 1.044,60 x 0,09 = 94,01
- Faixa que atinge o salário: [3.000,00 - 2.089,60] x 0,12 = 910,40 x 0,12 = 109,24
- Total a recolher: 109,24 + 94,01 + 78,37 = 281,62
