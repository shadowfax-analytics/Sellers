select count(a.id) as orders,b.store_name as Store_Name,d.city ,
d.cluster_name as Cluster_Name,a.order_date,c.id as Sellerid
from coreengine_order a
join coreengine_sfxseller c on c.id = a.seller_id
join coreengine_sellerprofile b on b.id = c.seller_id
join coreengine_cluster d on d.id = c.cluster_id
where order_date = '2015-08-19'
group by d.cluster_name,b.store_name
