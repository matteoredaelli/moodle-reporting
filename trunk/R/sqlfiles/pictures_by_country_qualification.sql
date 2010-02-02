SELECT
        country,
	aim as qualification
FROM
        mdl_user u
WHERE
	deleted=0 and
	picture=1
