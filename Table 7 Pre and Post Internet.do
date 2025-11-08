// The below commands reproduce Table 7 of the main article. The data for this analysis can be found in the Stata data file "Article Level Data.dta".  

*****************************************************************
*** TABLE 7    Pre and post internet and double anonymous review 
*****************************************************************

** Column (1) Submission pre-1998 (Google engine launched Sept 1998)
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201) nodots: reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & yearsubmitted <= 1998, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201) nodots: reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if yearsubmitted <= 1998, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (2) Submission post-1998
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201) nodots: reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & yearsubmitted > 1998, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* Panel B, All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201) nodots: reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if yearsubmitted > 1998, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Column (3) Double anonymous review journals
** Economics in our core sample of journals that still have double anonymous review (as of 2024):
gen     AllBlind = 0
replace AllBlind = 1 if journal == "American journal of agricultural economics"
replace AllBlind = 1 if journal == "Cambridge journal of economics"
replace AllBlind = 1 if journal == "China economic review" 
replace AllBlind = 1 if journal == "Comparative economic studies"
replace AllBlind = 1 if journal == "Economic change and restructuring"
replace AllBlind = 1 if journal == "Economic systems"
replace AllBlind = 1 if journal == "Environmental and resource economics"
replace AllBlind = 1 if journal == "Health economics"
replace AllBlind = 1 if journal == "Journal of applied economics"
replace AllBlind = 1 if journal == "Journal of business and economic statistics"
replace AllBlind = 1 if journal == "Journal of comparative economics"
replace AllBlind = 1 if journal == "Journal of economic behavior and organization"
replace AllBlind = 1 if journal == "Journal of financial economics"
replace AllBlind = 1 if journal == "Journal of macroeconomics" 
replace AllBlind = 1 if journal == "Public choice"
replace AllBlind = 1 if journal == "The journal of international trade and economic development"
replace AllBlind = 1 if journal == "Economic modelling"
* Panel A, Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201) nodots: reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if AllBlind == 1 & EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)


*********************************************************************************************************************************************************************************************








