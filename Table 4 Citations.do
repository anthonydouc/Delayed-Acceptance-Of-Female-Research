// The below commands reproduce Table 4 of the main article. The data for this analysis can be found in the file "Article Level Data.dta"

// New variable definitions (for definitions of the other variables see Table 2 Baseline Results.do):
citationZscoreJo5       = research area normalised citation score, citations 5 year post publication
citationZscore          = research area normalised citation score, all citations
asinh_citation5         = asinh citations 5 year post publication
asinh_citation          = asinh citations, all years

***********************************************************
*** Table 4 Gender and citations 
***********************************************************

** Panel A Citation score
** 5 years post publication
* Column (1) Economics journals no interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (2) with interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5  Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (3) All journals no interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (4) with interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
** All year citations (except for the most recent five years)
* Column (5) Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (6) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (7) All journals no interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (8) with interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot

** Panel B Asinh transformation
** 5 years post publication
* Column (1) Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (2) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (3) All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (4) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
** All year citations (except for the most recent five years)
* Column (5) Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (6) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (7) All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (8) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe asinh_citation numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if YEAR < 2020 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot

** Panel C Solo-authored
** 5 years post publication
* Column (1) Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (2) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (3) All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (4) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if numberofauthors == 1 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
** All year citations (except for the most recent five years)
* Column (5) Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2020 & numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (6) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign  totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if EcoJournal == 1 & YEAR < 2020 & numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot
* Column (7) All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown propfemaleauthors if YEAR < 2020 & numberofauthors == 1, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* Column (8) Interaction
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.lnacceptancetime if YEAR < 2020 & numberofauthors == 1 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(lnacceptancetime=(1(0.5)6))
marginsplot

**** Discussed in the article, footnote 36
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.YEAR if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscoreJo5 numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.YEAR if  YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.YEAR if EcoJournal == 1 & YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe citationZscore numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 authorgroupshareofestimates count STATSIG sign totaltop5 Unknown c.propfemaleauthors##c.YEAR if  YEAR < 2020, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

*******************************************************************************************************************************************************************************************
