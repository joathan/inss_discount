setup:
	@echo "🛠️ Configurando o projeto..."
	@cp .env.template.erb .env
	@echo "📦 Instalando as dependências..."
	@docker compose up --build -d > temp.log 2>&1 & \
	pid=$$!; \
	tail -f temp.log & \
	tail_pid=$$!; \
	wait $$pid; \
	kill -9 $$tail_pid; \
	rm temp.log
	@echo "❓ Deseja executar o seed?"
	@echo "⚠️  Aviso: Esta ação excluirá todos os dados atuais do banco de dados."
	@read -p "⚠️  Deseja continuar? (s/n): " answer; \
	if [ "$$answer" != "s" ]; then \
		echo "🛑 Seed não executado; seu banco de dados está vazio."; \
	else \
		echo "🌱 Gerando dados..."; \
		docker compose exec -it inss bundle exec rails db:seed >/dev/null 2>&1; \
		echo "✅ Dados gerados com sucesso."; \
		echo "📩 Use: email: admin@inss.com.br"; \
		echo "🔑      senha: 123123"; \
	fi
	@echo "✅ Projeto configurado com sucesso."
	@echo "🚀 Acesse http://localhost:8020 para visualizar o projeto."
