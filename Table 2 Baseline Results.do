// The below commands reproduce Table 2 of the main article. The data for this analysis can be found in the file "Article Level Data.dta"

// Variable definitions:
lnacceptancetime            = natural logarithm of the number of weeks from submission to acceptance time
propfemaleauthors           = proportion of authors who are female
Unknown                     = binary variable = 1 if at the gender of at least one author could not be determined 
EcoJournal                  = binary variable = 1 if the journal is one of the 54 economics journals listed in the Appendix to the main article
filename (= Nresearcharea)  = the name of the meta-analysis  
numberofauthors             = the number of co-authors 
temporal_rank               = the temporal position of a study within a meta-analysis
ShareTop10                  = the proportion of authors employed in a top 10 university
ShareTop20                  = the proportion of authors employed in a top 11-20 university
ShareTop30                  = the proportion of authors employed in a top 21-30 university
ShareTop40                  = the proportion of authors employed in a top 31-40 university
ShareTop50                  = the proportion of authors employed in a top 41-50 university
ShareTop60                  = the proportion of authors employed in a top 51-60 university
ShareTop70                  = the proportion of authors employed in a top 61-70 university
ShareTop80                  = the proportion of authors employed in a top 71-80 university
ShareTop90                  = the proportion of authors employed in a top 81-90 university
ShareTop100                 = the proportion of authors employed in a top 91-100 university
totaltop5                   = total number of top 5 publications by all authors prior to submission
OtherTopJournals            = total number of the non-top 5 publications by all authors prior to submission (see Heckman and Moktan (2020) for the list of journals)
authorgroupshareofestimates = share of estimates within a research area reported by a group of authors 
count                       = number of estimates reported in an article 
STATSIG                     = statistical significance at least at 5%, average of all estimates reported within an article
sign                        = sign reversal, average of all estimates reported within an article

************************************************************
*** Table 2 Gender and time to acceptance, baseline results 
************************************************************

** Column (1) Journal and year fixed effects
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal ) vce(cluster filename)
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime Unknown propfemaleauthors, absorb( acceptanceyear  Njournal ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)

** Column (2) Research area fixed effects
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)

** Column (3) Article level controls
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100  Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)

** Column (4) Article level controls, with research productivity
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)

** Column (5) Estimate level controls
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)

** Column (6) Estimate level controls, with statistical significance
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
drop sample
generate sample=e(sample)
sum acceptance_time_weeks if propfemaleauthors == 1 & sample == 1
sum acceptance_time_weeks if propfemaleauthors == 0 & sample == 1
display  e(N_full)


** Footnote 24, test for non-linearity
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.propfemaleauthors , absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

******************************************************************************************************************************************************************************
