SELECT * FROM ebdb.coreengine_sellerprofile a , ebdb.coreengine_cluster b , ebdb.coreengine_sfxseller c 
where c.seller_id=a.id and c.cluster_id=b.id 