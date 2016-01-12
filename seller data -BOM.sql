select e.city ,e.cluster_name,c.store_name,c.id as Seller_id ,b.id as Sfx_ID,b.date_active,d.chain_name,
(case when b.status = 1 then 'Active' when b.status = 0
then 'InActive' end) Active_Status

from coreengine_sfxseller b 
join coreengine_sellerprofile c on c.id = b.seller_id
join coreengine_chain d on d.id = b.chain_id
join coreengine_cluster e on e.id = b.cluster_id
where e.city='BOM'and e.cluster_name not like'%Test%'
order by cluster_name , store_name , date_active DESC


