# Etapa 1: Definir a imagem base
# Usando a imagem Alpine com Python 3.13, conforme solicitado.
# É uma base leve, excelente para produção.
FROM python:3.13.5-alpine3.22

# Etapa 2: Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências e instalá-las
# Copiamos o requirements.txt primeiro para aproveitar o cache de camadas do Docker.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 4: Copiar o restante do código da aplicação
COPY . .

# Etapa 5: Expor a porta em que a aplicação será executada
EXPOSE 8000

# Etapa 6: Comando para iniciar a aplicação em modo de produção
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
