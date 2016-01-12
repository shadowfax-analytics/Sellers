select b.seller_id ,a.store_name, a.store_type ,c.cluster_id ,c.date_active ,b.contact_number,b.order_date,d.cluster_name
from coreengine_order as b,  coreengine_sellerprofile as a, coreengine_sfxseller as c, coreengine_cluster as d
where b.seller_id = c.id and c.seller_id= a.id and  a.city = "BLR" and order_date >='01/10/2015' and b.cluster_id=d.id 