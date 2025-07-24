SELECT
  c.Regiao,
  c.Segmento,
  SUM(f.Lucro) AS Total_Lucro
FROM
(
  SELECT
    ID_Pedido,
    argMax(ID_Cliente, process_timestamp) AS ID_Cliente,
    argMax(Lucro, process_timestamp) AS Lucro
  FROM fato_pedidos
  GROUP BY ID_Pedido
) AS f
JOIN
(
  SELECT
    ID_Cliente,
    argMax(Regiao, process_timestamp) AS Regiao,
    argMax(Segmento, process_timestamp) AS Segmento
  FROM dim_cliente
  GROUP BY ID_Cliente
) AS c
ON f.ID_Cliente = c.ID_Cliente
GROUP BY c.Regiao, c.Segmento
ORDER BY c.Regiao, c.Segmento;
