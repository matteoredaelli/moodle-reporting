#!/usr/bin/sh

Rcmd=/apps/R/bin/Rscript
SCRIPT_DIR=/apps/scripts/moodle
SQL_DIR=$SCRIPT_DIR/sqlfiles

cd $SCRIPT_DIR

for file in $SQL_DIR/*sql
do
	echo executing $Rcmd moodle-charts-2-cols.R $file
	$Rcmd moodle-charts-2-cols.R $file
done

# SCORM REPORTS

for report in 1:42,44,46,48,50 2:55,57,59,61,63 4:69 5:72
do
	scormid=$(echo $report | cut -f1 -d':')
	scoid_list=$(echo $report | cut -f2 -d':'| sed -e 's/,/ /g')
	echo executing moodle-scorm.R $scormid
	$Rcmd moodle-scorm.R $scormid

	for scoid in $scoid_list ; do
		echo executing moodle-scorm-test.R $scormid $scoid
		$Rcmd moodle-scorm-test.R $scormid $scoid
	done
done

