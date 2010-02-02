SELECT
	substring_index(c.fullname, '_', 1) as country,
	u.aim as qualification
FROM mdl_course c
	INNER JOIN mdl_context cx ON c.id = cx.instanceid 
	INNER JOIN mdl_role_assignments ra ON cx.id = ra.contextid
	INNER JOIN mdl_role r ON ra.roleid = r.id
	INNER JOIN mdl_user u on ra.userid = u.id
WHERE
	c.visible=1 and
	r.id=5 and
	c.fullname like '%\\_%' and
	ra.timestart <= UNIX_TIMESTAMP() and
	(ra.timeend = 0 or UNIX_TIMESTAMP() <= ra.timeend)  and
	u.auth='ldap' and
	u.deleted = 0
group by
	c.fullname

