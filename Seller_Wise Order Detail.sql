select c.id as sfx_Seller,c.seller_id,store_name,d.cluster_name,e.chain_name,b.city,a.id as order_id,a.name as customer_name,a.contact_number, house_number,a.locality,a.latitude,a.longitude,date(convert_tz(order_time,"UTC","Asia/Kolkata")) as OrderDate,
convert_tz(order_time,"UTC","Asia/Kolkata") as order_time,convert_tz(accept_time,"UTC","Asia/kolkata") as accept_time, convert_tz(allot_time,"UTC","Asia/Kolkata") as allot_time,convert_tz(pickup_time,"UTC","Asia/Kolkata") as pickup_time,convert_tz(delivered_time,"UTC","Asia/Kolkata") as delivered_time ,g.id as rider_id,
first_name,last_name,accepted_flag,pickup_flag,delivered_flag,a.status,cancel_reason

from coreengine_order as a, coreengine_sellerprofile as b, coreengine_sfxseller as c, coreengine_cluster as d, coreengine_chain as e,coreengine_sfxrider as f, coreengine_riderprofile as g

where a.seller_id = c.id and c.seller_id=b.id and b.city = 'BLR' and c.cluster_id=d.id and c.chain_id = e.id and a.rider_id = f.id and f.rider_id = g.id and date(convert_tz(order_time,"UTC","Asia/Kolkata")) >= "20151110" and date(convert_tz(order_time,"UTC","Asia/Kolkata")) <= "20151117" and a.status = '302' 
order by c.status DESC