select d.cluster_name ,
d.city, a.seller_id ,b.store_name,
avg(case when (date(a.rating_date)>=adddate(curdate(),-2) 
and date(a.rating_date)<=adddate(curdate(),-1))then a.rating else 0 end) as cur_2days_avg,
avg(case when (date(a.rating_date)>=adddate(curdate(),-30) 
and date(a.rating_date)<=adddate(curdate(),-1))then a.rating else 0 end) as month_avg



from coreengine_sellerrating as a, coreengine_sellerprofile as b,
coreengine_sfxseller as c, coreengine_cluster as d
where a.seller_id = c.id and c.seller_id=b.id  and c.cluster_id=d.id   and
a.rating_date<=adddate(curdate(),-1)and d.cluster_name <> 'TestCluster'
group by a.seller_id 
order by city ,cluster_name , month_avg DESC
