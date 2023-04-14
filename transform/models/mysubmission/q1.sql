SELECT
  country_name,
  ROUND(SUM(gmv_local),2) AS gmv_total
FROM
  `foodpanda-383505.orders.orders`
GROUP BY
  country_name
