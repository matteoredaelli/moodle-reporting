#!/apps/R/bin/Rscript

args <- commandArgs()
scormid <- args[6]
scoid <- args[7]

upper_limit <- 100

sql_attendances <- paste("
select max(cast(value as unsigned)) as max_score 
		from mdl_scorm_scoes_track 
	where
		element = 'cmi.core.score.max' and
		scoid=",scoid," and
		scormid =",scormid,
	" group by userid",sep="")

channel = odbcConnect("LEARNINGLAB", "root", "password")
attendances <- sqlQuery(channel, sql_attendances)

odbcClose(channel)

res <- table( cut(attendances$max_score, breaks=c(0,80,85,90,95,100,101),  right = FALSE) )
title <- paste("scorm-", scormid, "-test-",scoid,"-by-maxscore",sep="")
filename <- paste( outdir, "/", title,"-bar.png", sep="")

bitmap(filename)  
barchart(res, main=title, col=cols, horizontal=FALSE)

filename <- paste( outdir, "/", title,"-pie.png", sep="")
bitmap(filename)  

labels = paste( names(res), res, round(res/sum(res) * 100, 1), sep=", ")
labels = paste( labels, "%", sep="")
pie( res, main="OnLine course: test results", col=cols, labels=labels, cex=1)

dev.off()                                  
q()  
