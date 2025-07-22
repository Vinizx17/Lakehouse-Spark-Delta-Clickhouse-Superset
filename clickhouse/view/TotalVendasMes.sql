SELECT
  toStartOfMonth(f.Data_Pedido) AS Mes,
  SUM(f.Total_Vendas) AS Total_Vendas
FROM fato_pedidos f
GROUP BY Mes
ORDER BY Mes
