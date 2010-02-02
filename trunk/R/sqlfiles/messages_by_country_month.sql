SELECT
        u.country,
        from_unixtime(timecreated, '%Y%m') as month
FROM
        mdl_message m,
        mdl_user u
WHERE
        m.useridfrom=u.id

