select
               substring_index(c.fullname, '_', 1) as country,
                from_unixtime( min(fsd.timestart), '%Y%m') as month
from
                mdl_course c,
                mdl_facetoface f,
                mdl_facetoface_sessions fs,
        mdl_facetoface_sessions_dates fsd
where
                c.fullname like '__\_%' and
        fsd.sessionid = fs.id and
                fs.facetoface = f.id  and
                f.course = c.id
group by
        fsd.sessionid
