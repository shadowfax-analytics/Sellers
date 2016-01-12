select a.rating_date ,a.rating ,a.seller_id ,d.cluster_name ,d.city ,b.store_name
from coreengine_sellerrating as a, coreengine_sellerprofile as b, coreengine_sfxseller as c, coreengine_cluster as d
where a.seller_id = c.id and c.seller_id=b.id  and c.cluster_id=d.id and a.rating_date<=curdate() and d.cluster_name <> 'TestCluster'
