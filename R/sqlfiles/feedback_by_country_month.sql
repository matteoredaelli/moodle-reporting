SELECT
        substring_index(c.fullname, '_', 1) as country,
        from_unixtime(fc.timemodified, '%Y%m') month
FROM
        mdl_course c,
        mdl_feedback f,
        mdl_feedback_completed fc
WHERE
        fc.feedback = f.id and
        f.course = c.id and
        c.fullname like '__\_%'

