#!/apps/R/bin/Rscript

args <- commandArgs()
scormid <- args[6]

sql_attendances <- paste("select
        lastaccess,
  gg.finalgrade,
  gi.grademax
from
        mdl_grade_items gi,
        mdl_grade_grades gg,
        mdl_user u
where
        gg.userid=u.id and
        gg.itemid=gi.id and
        gi.itemtype='mod' and
        gi.itemmodule='scorm' and
        u.auth = 'ldap' and
        gi.iteminstance = ", scormid,sep="")

attendances <- sqlQuery(channel, sql_attendances)

odbcClose(channel)

title <- paste("scorm-", scormid, "-by-grade",sep="")
filename <- paste( outdir, "/", title,".png", sep="")
bitmap(filename)  
barchart(
	table(attendances$finalgrade), 
	horizontal=FALSE,
	cex.names=0.9,  
	main=title, 
	xlab="Score",
	ylab="People", 
	col=cols
)

title <- paste("scorm-", scormid, "-by-lastaccess-days",sep="")
filename <- paste( outdir, "/", title,".png", sep="")
bitmap(filename)
hist(as.POSIXct(as.matrix(attendances['lastaccess'][1]),origin="1970-01-01"), "days",freq = TRUE,col=c("yellow"), xlab="days")


title <- paste("scorm-", scormid, "-by-lastaccess-weeks",sep="")
filename <- paste( outdir, "/", title,".png", sep="")
bitmap(filename)
hist(as.POSIXct(as.matrix(attendances['lastaccess'][1]),origin="1970-01-01"), "weeks",freq = TRUE,col=c("yellow"), xlab="weeks") 

title <- paste("scorm-", scormid, "-by-lastaccess-months",sep="")
filename <- paste( outdir, "/", title,".png", sep="")
bitmap(filename)
hist(as.POSIXct(as.matrix(attendances['lastaccess'][1]),origin="1970-01-01"), "months",freq = TRUE,col=c("yellow"), xlab="months") 

dev.off()                                  
q()  
