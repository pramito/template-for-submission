WITH sub1 AS (
SELECT 
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
   country_name,
   vendor_name
 ORDER BY
   gmv_total

)

SELECT 
country_name,
vendor_name,
gmv_total

FROM ( 
   SELECT country_name,
   vendor_name,
   gmv_total,
   MAX(gmv_total) OVER (PARTITION by country_name) AS gmv_max FROM sub1)


WHERE gmv_total = gmv_max
