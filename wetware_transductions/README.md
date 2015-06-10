The scripts which were used in creating 'Wetware Transductions' - a reflection on the fact that swathes of genetic data had been corrupted not by virus not mutation, but by the auto formatting features of Microsoft Excel
http://www.stephenfortune.net/works/wetware-transductions


parse.sh and readwrite.pl used in conjunction to prepare a video for insertion into animate.xls

.csv produced by parse.sh is to be copied to row ?100 in excel spreadsheet (? column number dependant on spreadsheet used

excel spreadsheets, and associated VB macros, derived from http://excel.acdc.com/  

If possible, it is recommended to use .xls, as changes to regex in 2007 onwards hinders ability for regex formatting to be performed (see http://www.stephenfortune.net/blog/regex-excel-vba-i-have-no-idea-how-many-problems-i-have/ for details)

animate_shading(.xls) - .csv copied to cells E100 onwards includes regex macros  

    .Pattern = "\.|%" is combined with .Font.Color = RBG (VAL, VAL, VAL) to change colour of selected column (E, in this case)

regex macros must be executed prior to triggering FOLD button macro  

animate(.xlsm) - .csv copied to (hidden) cells q100 onwards  


