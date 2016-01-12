select c.id as Seller_id,store_name,e.chain_name,d.cluster_name,b.city,date(convert_tz(order_time,"UTC","Asia/Kolkata")) as OrderDate,count(*) as total_orders

from coreengine_order as a, coreengine_sellerprofile as b, coreengine_sfxseller as c, coreengine_cluster as d, coreengine_chain as e

where a.seller_id = c.id and c.seller_id=b.id and c.cluster_id=d.id and c.chain_id = e.id and date(convert_tz(order_time,"UTC","Asia/Kolkata")) >=curdate()-40
group by c.id,date(convert_tz(order_time,"UTC","Asia/Kolkata"))	  
