#  Data Lakehouse com Spark, Delta Lake, MinIO, ClickHouse e Superset

Este projeto demonstra uma arquitetura moderna de dados em container, integrando:

- Apache Spark com Delta Lake para processamento de dados.
- MinIO como armazenamento em estilo S3.
- ClickHouse como banco OLAP de alta performance.
- Apache Superset para visualização de dados.
- Jupyter Notebook para ingestão, transformação e exploração.

Acesso:

Credenciais de exemplo no.env.example, basta copiar e criar um arquivo .env

Subir o ambiente:

docker-compose up -d --build

URL:
Jupyter	http://localhost:8888
MinIO	http://localhost:9001
Superset	http://localhost:8088

Código python:

Disponivel em notebooks
Código para processar dados em delta e código de ingestão no clickhouse

Query SQL:

Disponivel na pasta clickhouse
Script para criar o banco na subida do container via entrypoint
Script para gerar queries no apache superset

Dependencias:

Disponivel em dockerfile, download dos JARS compativeis com delta + Spark e Minio + driver JDBC do clickhouse e clickhouse connect para conexão do superset com clickhouse

Passo a Passo:

Na pasta data esta disponivel o csv

Criar bucket landing e staging no Minio

Criar acess_key no Minio

Adicionar o csv no bucket landing

Executar código python dos notebooks Pyspar_delta e clickhouse

criar conexão no superset adicionando a fonte de dados clickhouse conect, inserir no host o nome do container, colocar a porta, banco, usuario e senha

em SQLab executar os scripts disponivel em clickhouse/view e criar os dashboards

Exemplos de graficos disponiveis na pasta superset


Disclaimer: Ambiente de estudo, não recomendado em produção
