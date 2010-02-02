select
	substring_index(c.fullname, '_', 1) as country,
	from_unixtime( fs.timecreated, '%Y%m') as month
from
	mdl_course c,
	mdl_facetoface f,
	mdl_facetoface_submissions fs
where
	fs.timecancelled = 0 and
	fs.facetoface = f.id and
	f.course = c.id and
	c.fullname like '__\_%'

