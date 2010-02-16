select
                substring_index(c.fullname, '_', 1) as country,
                from_unixtime(f.timemodified, '%Y%m') as month
from
                mdl_course c,
                mdl_facetoface f
where
                c.fullname like '__\_%' and
                f.course = c.id
