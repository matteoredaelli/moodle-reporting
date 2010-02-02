#!/apps/R/bin/Rscript

args <- commandArgs()
fullpathname<- args[6]

# removing path from fullpathname
 
a <-  strsplit(fullpathname, "/")[[1]]
sqlfile <- a[length(a)]

title = strsplit(sqlfile, "\\.")[[1]][1]
  
text = readLines( fullpathname, n=-1)

sqlstring <- paste(text,collapse=" ")
sqlresult <- sqlQuery(channel, sqlstring)

#############################################################
# barchart - 1 column
#############################################################
imagefile <- paste( outdir, "/",title,"-1.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")
barchart(
         table(sqlresult[[1]]),
         horizontal=FALSE,
         col=cols,
         stacked=TRUE,
         scales = list(x=list(rot=90))
         )

#############################################################
# barchart - 2 column
#############################################################
imagefile <- paste( outdir, "/",title,"-2.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")
barchart(
         table(sqlresult[[2]]),
         horizontal=FALSE,
         col=cols,
         stacked=TRUE,
         scales = list(x=list(rot=90))
         )

#############################################################
# pie - 1 column
#############################################################
imagefile <- paste( outdir, "/",title,"-1-pie.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")
records=table(sqlresult[[1]])
labels = paste( names(records),records, round(records/sum(records) * 100,1), sep=", ")
labels = paste( labels, "%", sep="")
pie(records, labels=labels, col=cols)

#############################################################
# pie - 2 column
#############################################################
imagefile <- paste( outdir, "/",title,"-2-pie.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")
records=table(sqlresult[[2]])
labels = paste( names(records),records, round(records/sum(records) * 100,1), sep=", ")
labels = paste( labels, "%", sep="")
pie(records, labels=labels, col=cols)

#############################################################
# barchart - 1 and 2 columns
#############################################################
imagefile <- paste( outdir, "/",title,"-12.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")

barchart(
         table(sqlresult[[1]],sqlresult[[2]]),
         group=sqlresult[[2]],
         horizontal=FALSE,
         col=cols,
         stacked=TRUE,
         scales = list(x=list(rot=90))
         ) 
  
#############################################################
# barchart - 2 and 1 columns
#############################################################
imagefile <- paste( outdir, "/",title,"-21.png", sep="")
bitmap(imagefile, width=width, height=height,units="px")

barchart(
         table(sqlresult[[2]],sqlresult[[1]]),
         group=sqlresult[[1]],
         horizontal=FALSE,
         col=cols,
         stacked=TRUE,
         scales = list(x=list(rot=90))
         )
dev.off()

odbcClose(channel)
q()
