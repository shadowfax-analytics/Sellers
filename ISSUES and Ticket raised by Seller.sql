select a.id as ticket_id , a.date_raised ,
case a.type_ticket 
when 1 then 'Rider'
when 2 then 'Seller'
end  ,

a.description ,
case a.status 
when 1 then 'Pending'
when 2 then'Approved'
when 3 then  'Revoked'
when 4 then 'SuperRevoked'
end  ,

case a.flag 
when 1 then'Unresolved'
when 2 then 'Resolved'
when 3 then 'Closed'
end ,

a.approved_date ,a.revoked_date , a.closed_date ,
case a.expired 
when 1 then 'Yes' 
when 2 then  'NO'
end ,

a.amount ,
a.category_id,
b.category,
b.description,
a.cluster_id,
c.cluster_name,
c.city,
a.seller_id,
d.store_name,
a.lastapproved_id,
a.raised_id,
a.revoke_user_id

from coreengine_tickets as a 
join coreengine_ticketcategory as b on a.category_id=b.id
join coreengine_cluster as c  on a.cluster_id=c.id 
join coreengine_sellerprofile as d on a.seller_id=d.id 

where date_raised>=adddate(curdate(),-7)
order by  a.date_raised DESC 

