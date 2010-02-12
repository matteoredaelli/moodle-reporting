library(RODBC)
library(lattice)

cols <- c("red","yellow","green","blue","cyan","orange","pink","gray","lightblue","lightgreen","darkblue","darkgreen")

#cols <- rainbow(30)

#########################################################################
# Folder where the charts wil be created
#########################################################################
outdir <- "/tmp"
sqlsubdir <- "sqlfiles"

width = 500
height = 500

#########################################################################
# ODBC database parameter
#########################################################################
# example of odbc.ini file
# [LEARNINGLAB]
# Driver       = MySQL
# Description  = MOODLEDB
# Server       = localhost
# Port         =
# User         = 
# Password     = 
# Database     = MYDB
# Option       = 3
# Socket       =

channel = odbcConnect("LEARNINGLAB", "backup", "backup")

.First <- function() {
}

.Last <- function() {
}
