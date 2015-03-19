![http://moodle-reporting.googlecode.com/svn/trunk/rrdtool/doc/moodle_users_web20_attributes-365days.png](http://moodle-reporting.googlecode.com/svn/trunk/rrdtool/doc/moodle_users_web20_attributes-365days.png)

# Requirements #

**[ruby](http://www.ruby-lang.org)** ruby-mysql
**ruby-dbi** [rrdtool](http://oss.oetiker.ch/rrdtool/)


# Details #

Create a rrd database with

> moodle-rrd-create.sh

Schedule each day the following scripts

  * moodle-rrd-update.rb

  * moodle-rrd-chart.sh