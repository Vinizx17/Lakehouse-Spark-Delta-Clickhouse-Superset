FROM jupyter/pyspark-notebook:spark-3.5.0

USER root

# Baixar Delta Spark 3.2.0 para Scala 2.12 + conectores S3
RUN wget -P $SPARK_HOME/jars https://repo1.maven.org/maven2/io/delta/delta-spark_2.12/3.2.0/delta-spark_2.12-3.2.0.jar && \
    wget -P $SPARK_HOME/jars https://repo1.maven.org/maven2/io/delta/delta-storage/3.2.0/delta-storage-3.2.0.jar && \
    wget -P $SPARK_HOME/jars https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar && \
    wget -P $SPARK_HOME/jars https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar

# Baixar driver JDBC do ClickHouse versão 0.4.6 direto do Maven Central
RUN wget -P $SPARK_HOME/jars https://repo1.maven.org/maven2/com/clickhouse/clickhouse-jdbc/0.4.6/clickhouse-jdbc-0.4.6.jar

USER $NB_UID

# Instalar Delta Spark + python-dotenv
RUN pip install delta-spark==3.2.0 python-dotenv

# Substituir o CMD padrão para ler variável de token da env
CMD ["bash", "-c", "jupyter lab --ip=0.0.0.0 --NotebookApp.token=${JUPYTER_TOKEN:-} --no-browser --allow-root"]
