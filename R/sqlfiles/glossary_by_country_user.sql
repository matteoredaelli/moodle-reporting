select
                substring_index(c.fullname, '_', 1) as country,
                u.username
from
                mdl_course c,
                mdl_glossary g,
                mdl_glossary_entries ge,
        mdl_user u
where
        ge.userid = u.id and
        ge.glossaryid = g.id and
        g.course = c.id and
	c.fullname like '__\_%' and
        c.visible = 1

