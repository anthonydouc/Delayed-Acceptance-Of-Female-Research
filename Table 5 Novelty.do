// The below commands reproduce Table 5 of the main article. The data for this analysis can be found in the file "Article Level Data.dta"

// New variable definitions (for definitions of the other variables see Table 2 Baseline Results.do):
novelty_keywords       =  our keyword novelty index
nov_sem_dist_arts2025  =  Arts et al. (2025) novelty index

***********************************************************
*** Table 5 Gender and research novelty 
***********************************************************


*** Panel A, our keyword novelty index
** Column (1) Time to acceptance, economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 novelty_keywords Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) Time to acceptance, all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals  totaltop5 novelty_keywords Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
** Column (3) Research novelty, economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe novelty_keywords numberofauthors temporal_rank authorgroupshareofestimates  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5  Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
** Column (4) Research novelty,  all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe novelty_keywords numberofauthors temporal_rank authorgroupshareofestimates  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100  totaltop5 Unknown propfemaleauthors , absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Panel B, Arts et al. (2025) index
** Column (1) Time to acceptance, economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5  nov_sem_dist_arts2025 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Column (2) Time to acceptance, all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5  nov_sem_dist_arts2025 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
** Column (3) Research novelty, economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe nov_sem_dist_arts2025 numberofauthors temporal_rank authorgroupshareofestimates  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5  Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
** Column (4) Research novelty,  all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe nov_sem_dist_arts2025 numberofauthors temporal_rank authorgroupshareofestimates  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 totaltop5 Unknown propfemaleauthors , absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

*************************************************************************************************************************************************************************************************



