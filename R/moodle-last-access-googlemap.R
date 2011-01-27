#!/apps/R/bin/Rscript

library(RODBC)

args <- commandArgs()
days <- args[6]

sqlquery <- paste("select country, count(*) as visitors
from mdl_user
where
    deleted=false and
    lastaccess >= UNIX_TIMESTAMP() - 60*60*24*", days," and
    country <> ''
group by country
", sep="")

last_access <- sqlQuery(channel, sqlquery)
odbcClose(channel)

countries <- paste(last_access$country, collapse="")
values <- paste(last_access$visitors, collapse=",")

for (map in c("world", "europe")) {
url <- "http://chart.apis.google.com/chart?chf=bg,s,EAF7FE&chs=440x220&cht=t&chco=FFFFFF,FF0000,FFFF00,00FF00&chld=__COUNTRIES__&chd=t:__VALUES__&chtm=__MAP__"

url <- gsub("__COUNTRIES__", countries, url)
url <- gsub("__VALUES__", values, url)
url <- gsub("__MAP__", map, url)

command <- paste("/usr/bin/wget -O users-lastaccess-", days, "-days-", map, ".png", " \"", url, "\"", sep="") 
system(command)
}
