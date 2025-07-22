SELECT
  c.Regiao,
  c.Segmento,
  SUM(f.Lucro) AS Total_Lucro
FROM fato_pedidos f
JOIN dim_cliente c ON f.ID_Cliente = c.ID_Cliente
GROUP BY c.Regiao, c.Segmento
ORDER BY c.Regiao, c.Segmento
