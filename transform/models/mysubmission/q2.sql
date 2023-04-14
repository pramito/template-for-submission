SELECT 
  vendor_name,
  COUNT(b.vendor_name) AS customer_count,
  ROUND(SUM(gmv_local),2) AS gmv_total

FROM
  `foodpanda-383505.newdataset.orders` a
INNER JOIN
  `foodpanda-383505.newdataset.vendors` b
ON
  a.vendor_id=b.id

  WHERE b.country_name like 'Taiwan'

GROUP BY
   
   vendor_name

ORDER BY customer_count DESC
