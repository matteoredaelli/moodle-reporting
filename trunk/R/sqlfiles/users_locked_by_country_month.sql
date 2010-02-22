select 
	country,
	from_unixtime(lastaccess,"%Y%m") as month
from 
	mdl_user
where
	auth='nologin'
