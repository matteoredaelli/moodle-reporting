# step di 8 ore
rrdtool create moodle.rrd \
         --start now \
         --step 28800 \
         DS:users:GAUGE:57600:0:50000 \
         DS:pictures:GAUGE:57600:0:50000 \
         DS:tags:GAUGE:57600:0:50000 \
         DS:descriptions:GAUGE:57600:0:50000 \
         DS:courses:GAUGE:57600:0:50000 \
         DS:facetoface_user:GAUGE:57600:0:50000 \
         DS:facetoface_teacher:GAUGE:57600:0:50000 \
         RRA:AVERAGE:0.5:1:730 \
         RRA:AVERAGE:0.5:14:520
