** These commands reproduce the estimates reported in the Online Supplement. The data for this can be found in the file ...........

* Tables S1 and S2 report the full results associated with Table 2 of the main text. The commands for this can be found in "Table 2 Baseline results.do" 

* Table S3 reports the full results associated with Table 4 of the main text. The commands for this can be found in "Table 4 Citations.do"

* Table S4 Gender, acceptance time and research productivity, solo-authored articles
* Column (1) Economics recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco Unknown propfemaleauthors if EcoJournal == 1 & numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) All journals recent publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco Unknown propfemaleauthors if numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (3) Economics future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futuretopeco Unknown propfemaleauthors if EcoJournal == 1 & numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (4) All journals future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 futuretopeco Unknown propfemaleauthors if numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (5) Economics recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco futuretopeco Unknown propfemaleauthors if EcoJournal == 1 & numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (6) All journals recent and future publications
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 recenttopeco futuretopeco Unknown propfemaleauthors if numberofauthors == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

* Table S5		Alternate standard errors
* Column (1) reports the results from Table 2 of the main text
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) standard errors clustered at the journal level
* Panel A, Economics journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster Njournal)
* Panel B, All journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster Njournal)
* Column (3) standard errors clustered at the research area and journal level
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename Njournal) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename Njournal)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename Njournal) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename Njournal)

* Table S10    Gender and acceptance time, baseline results 
* The data for this analysis can be found in the file "Estimate level data.dta"
** Column (1) Journal and year fixed effects
* Panel A, Economics journals
reghdfe lnacceptancetime Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal ) vce(cluster filename)

** Column (2) Research area fixed effects
* Panel A, Economics journals
reghdfe lnacceptancetime Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (3) Article level controls
* Panel A, Economics journals
reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100  Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (4) Article level controls, with research productivity
gen OtherTopJournals = AllPastTopEco - totaltop5
* Panel A, Economics journals
reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (5) Estimate level controls
* Panel A, Economics journals
reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (6) Estimate level controls, with statistical significance
* Panel A, Economics journals
reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors [aweight = weight], absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)


*********************************************************************************************************************************************************************************************