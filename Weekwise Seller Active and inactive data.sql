select e.cluster_name,c.store_name,b.id,b.date_active,d.chain_name,
(case when b.status = 1 then 'Active' when b.status = 0coreengine_cluster
then 'InActive' end) Active_Status,
count(distinct(case when date(a.order_time)>= curdate() -7 
then a.id end)) as 1st_Week_Count_Nov,
count(distinct(case when date(a.order_time)>= curdate() - 10 and date(a.order_time) < curdate() - 7
then a.id end)) as 5th_Week_Count_Oct,
count(distinct(case when date(a.order_time)>= curdate() -17 and date(a.order_time) < curdate() - 10
then a.id end)) as 4th_Week_Count_0ct,
count(distinct(case when date(a.order_time)>= curdate() - 24 and date(a.order_time) < curdate() - 17
then a.id end)) as 3rd_Week_Count_oct,
count(distinct(case when date(a.order_time)>= curdate() - 31 and date(a.order_time) < curdate() - 24
then a.id end)) as 2nd_Week_Coun_oct,
count(distinct(case when date(a.order_time)>= curdate() - 38 and date(a.order_time) < curdate() - 31
then a.id end)) as 1st_Week_Count_oct
from coreengine_sfxseller b 
left join coreengine_order a on a.seller_id = b.id
join coreengine_sellerprofile c on c.id = b.seller_id
join coreengine_chain d on d.id = b.chain_id
join coreengine_cluster e on e.id = b.cluster_id
where  c.city ='BLR' and  a.order_date >= "20151001" and a.order_date <= "20151107"
group by 1,2