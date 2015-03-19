![http://www.r-project.org/Rlogo.jpg](http://www.r-project.org/Rlogo.jpg) [R](http://www.r-project.org/Rlogo.jpg) is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS...

![http://moodle-reporting.googlecode.com/svn/trunk/R/doc/i1.png](http://moodle-reporting.googlecode.com/svn/trunk/R/doc/i1.png)

# Setup #
  * only Unix: install unixodbc
  * install mysql odbc package ( check packages for your preferred linux distribution) or download from http://dev.mysql.com/downloads/connector/odbc
  * configure moodle odbc connection at operating system level (unix: files odbc.ini and odbcinst.ini, see http://moodle-reporting.googlecode.com/svn/trunk/R/.Rprofile)
  * Install R and Rodbc (http://cran.r-project.org/mirrors.html)
  * Download R folder
  * Customize .Rproject file...


The naming convention of course names in my moodle installation is

> CC\_Course Name

where CC is the ISO code of the country like IT, DE, US, UK, ...
The reports are just an example, you can customize sql queries as you need