SELECT
    ID_Pedido,
    argMax(Data_Pedido, process_timestamp) AS Data_Pedido,
    argMax(Total_Vendas, process_timestamp) AS Total_Vendas
  FROM fato_pedidos
  GROUP BY ID_Pedido
)
GROUP BY Mes
ORDER BY Mes
