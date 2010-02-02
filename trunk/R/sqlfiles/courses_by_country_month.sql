select
        substring_index(co.fullname, '_', 1) as country,
        from_unixtime(co.timecreated, '%Y%m') month
from
        mdl_course co
where
        co.fullname like '__\_%'
