select b.seller_id ,d.cluster_name,d.city ,c.cluster_id ,a.store_name,b.source ,b.order_date,count(*)
from coreengine_order as b,  coreengine_sellerprofile as a, coreengine_sfxseller as c, coreengine_cluster as d where b.seller_id = c.id and c.seller_id= a.id and   date(order_time) >=curdate() and b.cluster_id=d.id 
group by b.seller_id,source





