select d.city , d.cluster_name, a.seller_id,b.seller_id as sfx_id, c.store_name, c.store_type,case b.status when 0 then 'InActive' 
when 1 then 'Active' end as seller_status ,b.date_active, 
 datediff(adddate(curdate(),-1),b.date_active) as partnership_period
from coreengine_order as a 
join coreengine_sfxseller as b on b.id= a.seller_id
join coreengine_sellerprofile as c on c.id= b.seller_id
join coreengine_cluster as d on  d.id= b.cluster_id
where a.status!=302  and a.cluster_id!=1 and c.store_name not like '%Test%' and 
b.date_active<=adddate(curdate(),-1) 
group by a.seller_id
order by city ,cluster_name ,partnership_period DESC 