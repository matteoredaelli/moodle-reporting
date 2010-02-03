#!/bin/bash

width=600
height=300
step=43200
#step=86400
#step=172800
#step=28800

rrdfile=moodle.rrd
outdir=.

for start in -7days -31days -365days
do
  /usr/bin/rrdtool graph $outdir/moodle_users${start}.png -a PNG   \
        --start $start --end now --step $step              \
        --title "Learninglab Users: last ${start}"       \
        --vertical-label "Totals" --units-length 6 \
        --width $width --height $height --lower-limit 1 --units-exponent 0    \
        DEF:my2=$rrdfile:users:AVERAGE              \
        DEF:my3=$rrdfile:pictures:AVERAGE              \
        DEF:my4=$rrdfile:tags:AVERAGE              \
        DEF:my5=$rrdfile:descriptions:AVERAGE              \
        LINE1:my2#00FF00:"Users"  \
        LINE1:my3#FF00FF:"Pictures"  \
        LINE1:my4#FF0000:"Tags"	\
        LINE1:my5#0000FF:"Descriptions"

  /usr/bin/rrdtool graph $outdir/moodle_users_web20_attributes${start}.png -a PNG   \
        --start $start --end now --step $step              \
        --title "Learninglab Users - Web2.0 attributes: last ${start}"       \
        --vertical-label "Totals" --units-length 6 \
        --width $width --height $height --lower-limit 1 --units-exponent 0    \
        DEF:my3=$rrdfile:pictures:AVERAGE              \
        DEF:my4=$rrdfile:tags:AVERAGE              \
        DEF:my5=$rrdfile:descriptions:AVERAGE              \
        LINE1:my3#FF00FF:"Pictures"  \
        LINE1:my4#FF0000:"Tags"	\
        LINE1:my5#0000FF:"Descriptions"

  /usr/bin/rrdtool graph $outdir/moodle_courses${start}.png -a PNG   \
        --start $start --end now --step $step              \
        --title "Learninglab Courses: last ${start}"       \
        --vertical-label "Totals" --units-length 6 \
        --width $width --height $height --lower-limit 1 --units-exponent 0    \
        DEF:my2=$rrdfile:courses:AVERAGE              \
        DEF:my3=$rrdfile:facetoface_user:AVERAGE              \
        LINE1:my2#00FF00:"Courses"  \
        LINE1:my3#FF00FF:"Facetoface" 
done
