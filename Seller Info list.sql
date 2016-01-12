select e.city ,e.cluster_name,c.store_name,d.chain_name ,b.id as sfx_id , c.id as seller_id   ,b.date_active,
(case when b.status = 1 then 'Active' when b.status = 0
then 'InActive' end) Active_Status
from coreengine_sfxseller b 
left join coreengine_order a on a.seller_id = b.id
join coreengine_sellerprofile c on c.id = b.seller_id
join coreengine_chain d on d.id = b.chain_id
join coreengine_cluster e on e.id = b.cluster_id
where e.cluster_name <> 'TestCLuster'
order by e.city , e.cluster_name , b.status 
