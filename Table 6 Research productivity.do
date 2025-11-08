// The below commands reproduce Table 6 of the main article. The data for this analysis can be found in the Stata data file "Article Level Data.dta"


// New variable definitions (for definitions of the other variables see Table 2 Baseline Results.do):
totaltop5            = total number of prior top 5 publications
recenttopeco         = total number of publications in 4 years pre-submission of current article, articles published in Heckman and Moktan (2020) list
futuretopeco         = total number of publications in current year and in subsequent three years, articles published in Heckman and Moktan (2020) list
past4yearsall99      = total number of all publications 4 years pre-submission of current article, all research outputs, winzorised at 99%      
futureall99          = total number of publications in current year and in subsequent three years, all research outputs, winzorised at 99%   



******************************************************************
*** Table 6 Gender, acceptance time and research productivity 
******************************************************************

** Panel A. All authors
* Column (1) Economics recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) All journals recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (3) Economics future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futuretopeco Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (4) All journals future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futuretopeco Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (5) Economics recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco futuretopeco Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (6) All journals recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco futuretopeco Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Panel B. Economics and business journals
* Column (2) All journals recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco Unknown propfemaleauthors if NONECO == 0, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (4) All journals recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futuretopeco  Unknown propfemaleauthors if NONECO == 0, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (6) All journals recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco futuretopeco Unknown propfemaleauthors if NONECO == 0, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Panel C. All publications variable
* Column (1) Economics recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 past4yearsall99 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) All journals recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 past4yearsall99 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (3) Economics future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futureall99 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (4) All journals future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futureall99 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (5) Economics recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 past4yearsall99 futureall99 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (6) All journals recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 past4yearsall99 futureall99  Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
***********************************************************************************************************************************************************************************************

