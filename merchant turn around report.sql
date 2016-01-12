select d.city,cluster_name,store_name,date(order_time)OrderDate,
sum(case when source=0 then 1 else 0 end)OrdersSellerPortal,
sum(case when source=1 then 1 else 0 end)OrdersManagerPortal,
sum(case when source=2 then 1 else 0 end)OrdersManagerOld
from coreengine_order as a, 
coreengine_sfxseller as b, coreengine_sellerprofile as c, coreengine_cluster as d
where a.seller_id=b.id and b.seller_id=c.id and b.cluster_id=d.id and 
date(order_time)>= curdate()-interval 1 day and date(order_time)< curdate()
and d.city<> 'BLR' and d.city <> 'BOM' and cluster_name <> 'TestCluster'
group by 1,2,3,4
