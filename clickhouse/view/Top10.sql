SELECT
  p.Product_ID,
  p.Categoria,
  p.SubCategoria,
  SUM(f.Quantidade) AS Quantidade_Vendida
FROM fato_pedidos f
JOIN dim_produto p ON f.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Categoria, p.SubCategoria
ORDER BY Quantidade_Vendida DESC
LIMIT 10
