SELECT
  p.Categoria,
  SUM(f.Total_Vendas) AS Total_Vendas,
  SUM(f.Quantidade) AS Total_Quantidade
FROM
(
  SELECT
    ID_Pedido,
    argMax(Product_ID, process_timestamp) AS Product_ID,
    argMax(ID_Cliente, process_timestamp) AS ID_Cliente,
    argMax(Total_Vendas, process_timestamp) AS Total_Vendas,
    argMax(Quantidade, process_timestamp) AS Quantidade
  FROM fato_pedidos
  GROUP BY ID_Pedido
) AS f
JOIN
(
  SELECT
    Product_ID,
    argMax(Categoria, process_timestamp) AS Categoria,
    argMax(SubCategoria, process_timestamp) AS SubCategoria
  FROM dim_produto
  GROUP BY Product_ID
) AS p
ON f.Product_ID = p.Product_ID
GROUP BY p.Categoria
ORDER BY Total_Vendas DESC

