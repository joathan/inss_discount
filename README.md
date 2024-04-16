# README

Passos para rodar o projeto:

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

# Comandos úteis

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
