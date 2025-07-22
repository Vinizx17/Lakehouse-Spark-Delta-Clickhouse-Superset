SELECT
  p.Categoria,
  SUM(f.Total_Vendas) AS Total_Vendas,
  SUM(f.Quantidade) AS Total_Quantidade
FROM fato_pedidos f
JOIN dim_produto p ON f.Product_ID = p.Product_ID
GROUP BY p.Categoria
ORDER BY Total_Vendas DESC
