// These commands reproduce Table 8 of the main article. The data for this analysis can be found in the Stata data file "Article Level Data.dta"

// New variable definitions (for definitions of the other variables see Table 2 Baseline Results.do):

numberofuniqueeditors = the number of editors in the year an article was submitted for review
propneweditors        = the proportion of new editors in the year an article was submitted for review
propoffemaleeditors   = the proportion of female editors in the year an article was submitted for review
interaction           = propoffemaleeditors * propfemaleauthors


***********************************************************
*** Table 8 Editors, Gender and Time to Acceptance 
***********************************************************

** Column (1) Editorial board size and change
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 numberofuniqueeditors propneweditors Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (2) Female editors
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 numberofuniqueeditors propneweditors propoffemaleeditors Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

*** Column (3) Interaction with female editors
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 numberofuniqueeditors propneweditors  Unknown c.propoffemaleeditors##c.propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(propoffemaleeditors=(0(0.2)1))
marginsplot

*** Column (4) interact Female with Share of Female Editors
gen interaction = propfemaleauthors*propoffemaleeditors
cor propfemaleauthors propoffemaleeditors interaction

bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 numberofuniqueeditors propneweditors  Unknown interaction if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

*****************************************************************************************************************************************************************************************************