SELECT
        substring_index(c.fullname, '_', 1) as country,
        from_unixtime(cm.timestamp,'%Y%m') as month
FROM
        mdl_chat ca,
        mdl_course c,
        mdl_chat_messages cm,
        mdl_user u
WHERE
        cm.chatid=ca.id and
        cm.userid=u.id and
        ca.course=c.id and
        c.fullname like '__\_%'
