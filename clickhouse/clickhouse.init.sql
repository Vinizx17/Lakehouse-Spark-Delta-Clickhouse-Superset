CREATE DATABASE IF NOT EXISTS pedidos;
USE pedidos;

CREATE TABLE fato_pedidos (
    ID_Pedido String,
    Data_Pedido DateTime,
    ID_Cliente String,
    Product_ID String,
    Quantidade Int32,
    Total_Vendas Float64,
    Desconto Float64,
    Lucro Float64,
    process_timestamp DateTime
)
ENGINE = ReplacingMergeTree(process_timestamp)
ORDER BY ID_Pedido
SETTINGS index_granularity = 8192;

CREATE TABLE dim_cliente (
    ID_Cliente String,
    Segmento String,
    Regiao String,
    Pais String,
    Prioridade String,
    process_timestamp DateTime
)
ENGINE = ReplacingMergeTree(process_timestamp)
ORDER BY ID_Cliente
SETTINGS index_granularity = 8192;

CREATE TABLE dim_produto (
    Product_ID String,
    Categoria String,
    SubCategoria String,
    process_timestamp DateTime
)
ENGINE = ReplacingMergeTree(process_timestamp)
ORDER BY Product_ID
SETTINGS index_granularity = 8192;

