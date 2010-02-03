#!/apps/ruby/bin/ruby

require 'rubygems'
require 'dbi'


dbh = DBI.connect("DBI:Mysql:moodle_elearning:localhost", "user", "password")

statement = "select count(*) from mdl_user where deleted = 0"
users = dbh.select_all(statement).first.first

statement = "select count(*) from mdl_user where deleted = 0 and description !=''"
descriptions = dbh.select_all(statement).first.first

statement = "select count(*) from mdl_user where deleted = 0 and picture =1"
pictures = dbh.select_all(statement).first.first

statement = "select count(distinct itemid) from mdl_tag_instance where itemtype='user'"
tags = dbh.select_all(statement).first.first

statement = "select count(*) from mdl_course where visible=1"
courses = dbh.select_all(statement).first.first

#statement = "select count(*) from mdl_facetoface_submissions where timecancelled = 0"
statement = "select 
	count(*) 
from 
	mdl_facetoface_submissions
where
	timecancelled = 0
"

facetoface_user = dbh.select_all(statement).first.first

statement = "select count(*) from mdl_grade_grades gg, mdl_grade_items gi where gg.itemid = gi.id and gi.itemmodule='facetoface'"
facetoface_teacher = dbh.select_all(statement).first.first

timestamp = Time.now.to_i
cmdline = "/usr/bin/rrdtool update moodle.rrd #{timestamp}:#{users}:#{pictures}:#{tags}:#{descriptions}:#{courses}:#{facetoface_user}:#{facetoface_teacher}"

system "echo " + cmdline
system cmdline

