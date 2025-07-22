FROM apache/superset:2.1.0

USER root

# Instala dependências básicas (se necessário para o driver)
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Instala driver do ClickHouse
RUN pip install --no-cache-dir clickhouse-connect

USER superset
