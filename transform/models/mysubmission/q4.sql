
SELECT 
  EXTRACT(year FROM date_local) AS year,
  a.country_name,
  vendor_name,
  ROUND(SUM(gmv_local),2) AS gmv_total
  
FROM
  `foodpanda-383505.newdataset.orders` a
INNER JOIN
  `foodpanda-383505.newdataset.vendors` b
ON
  a.vendor_id=b.id

GROUP BY 
   date_local,
   country_name,
   vendor_name

   QUALIFY ROW_NUMBER() OVER (PARTITION BY country_name, year ORDER BY gmv_total) <= 2

 ORDER BY
  year,
  country_name,
   gmv_total DESC
   





  

