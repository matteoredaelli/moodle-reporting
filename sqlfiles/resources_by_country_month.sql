SELECT
        substring_index(c.fullname, '_', 1) as country,
        r.type
FROM
        mdl_course c,
        mdl_resource r
WHERE
        r.course = c.id and
        c.fullname like '__\_%'
