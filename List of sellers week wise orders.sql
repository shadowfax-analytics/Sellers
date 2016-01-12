select e.cluster_name,c.store_name,b.id,b.date_active,d.chain_name,
(case when b.status = 1 then 'Active' when b.status = 0
then 'InActive' end) Active_Status,
count(distinct(case when date(a.order_time)>= curdate() -7 
then a.id end)) as 4th_Week_Count,
count(distinct(case when date(a.order_time)>= curdate() - 14 and date(a.order_time) < curdate() - 7
then a.id end)) as 3rd_Week_Count,
count(distinct(case when date(a.order_time)>= curdate() - 21 and date(a.order_time) < curdate() - 14
then a.id end)) as 2nd_Week_Count,
count(distinct(case when date(a.order_time)>= curdate() - 28 and date(a.order_time) < curdate() - 21
then a.id end)) as 1st_Week_Count
from coreengine_sfxseller b 
left join coreengine_order a on a.seller_id = b.id
join coreengine_sellerprofile c on c.id = b.seller_id
join coreengine_chain d on d.id = b.chain_id
join coreengine_cluster e on e.id = b.cluster_id
where c.city <> 'BOM' and c.city <> 'BLR' and e.cluster_name <> 'TestCLuster'
and b.status = 1
group by 1,2
