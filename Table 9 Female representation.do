// These commands reproduce Table 9 of the main article. The data for this analysis can be found in the Stata data file "Estimate Level Data.dta"

***********************************************************
*** Table 9   Gender, female representation and time to acceptance  
***********************************************************

** Female presence in research area
preserve
collapse (firstnm) journal filename gender1 gender2 gender3 gender4 gender5 gender6 gender7 gender8 gender9 gender10 gender11 gender12 author1 author2 author3 author4 author5 author6 author7 author8 author9 author10 author11 author12 (mean) citationZscore citationZscoreJo5 acceptance_time_days acceptance_time_weeks lnacceptancetime Generalinterest STATSIG  yearsubmitted nfemaleauthors numberofauthors temporal_rank authorgroupshareofestimates sign first_dom_acceptance_and_submiss propfemaleauthors EXPERIMENT effectsize  count YEAR EcoJournal Unknown  ONEFEM ALLFEM HALFFEM FirstFemale MIXEDGENDER HengelFEMALE EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY  asinh_citation ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 lnsubmit asinh_citation5 Hengel Card2020 Alexander totaltop5 acceptanceyear NONECO n_total_premax n_total_pre_top5max numberofuniqueeditors propneweditors propoffemaleeditors AllPastTopEco novelty_keywords nov_sem_dist_arts2025 n_total_pre_topeconmax recenttopeco futuretopeco totalpriorpubs99 past4yearsall99  futureall99, by(studyid)
encode journal, gen(Njournal)
encode filename, gen(Nresearcharea)
replace propfemaleauthors = round(propfemaleauthors, 0.0001)
replace propneweditors = round( propneweditors , 0.0001)
replace propoffemaleeditors = round( propoffemaleeditors , 0.0001)
gen OtherTopJournals = AllPastTopEco - totaltop5

sort filename yearsubmitted studyid
by filename: gen runD = sum( nfemaleauthors)
by filename: gen Totalauthors = sum( numberofauthors )
by filename: gen avfemale = runD/Totalauthors
egen SFemale = mean( avfemale), by (yearsubmitted Nresearcharea)

** Column (1): Economics journals 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.SFemale if EcoJournal == 1 , absorb( yearsubmitted  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at( SFemale =(0(0.1)0.8))
marginsplot
** Column (2): All journals 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.SFemale , absorb( yearsubmitted  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at( SFemale =(0(0.1)0.8))
marginsplot
restore

*** Share of distinct authors
* Step 1 convert from wide to long form
preserve
collapse (firstnm) journal filename gender1 gender2 gender3 gender4 gender5 gender6 gender7 gender8 gender9 gender10 gender11 gender12 author1 author2 author3 author4 author5 author6 author7 author8 author9 author10 author11 author12 (mean) citationZscore citationZscoreJo5 acceptance_time_days acceptance_time_weeks lnacceptancetime Generalinterest STATSIG  yearsubmitted nfemaleauthors numberofauthors temporal_rank authorgroupshareofestimates sign first_dom_acceptance_and_submiss propfemaleauthors EXPERIMENT effectsize  count YEAR EcoJournal Unknown ONEFEM ALLFEM HALFFEM FirstFemale MIXEDGENDER HengelFEMALE EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY  asinh_citation ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 lnsubmit asinh_citation5 Hengel Card2020 Alexander totaltop5 acceptanceyear NONECO n_total_premax n_total_pre_top5max numberofuniqueeditors propneweditors propoffemaleeditors AllPastTopEco novelty_keywords nov_sem_dist_arts2025 n_total_pre_topeconmax recenttopeco futuretopeco totalpriorpubs99 past4yearsall99  futureall99, by(studyid)
encode journal, gen(Njournal)
encode filename, gen(Nresearcharea)
replace propfemaleauthors = round(propfemaleauthors, 0.0001)
replace propneweditors = round( propneweditors , 0.0001)
replace propoffemaleeditors = round( propoffemaleeditors , 0.0001)
gen OtherTopJournals = AllPastTopEco - totaltop5

sort filename yearsubmitted studyid
rename authorgroupshareofestimates groupshareofestimates
reshape long author gender, i(studyid) j(AUTHOR)
*** Absolute number of available distinct female authors
sort filename yearsubmitted studyid AUTHOR
egen taga1 = tag(author filename)
by filename: gen UNIQUE1 = sum( taga1 )
gen FEM1 = author if gender  == "Female"
egen tagFem1 = tag(FEM1 filename)
by filename: gen UNIQUEFem1 = sum( tagFem1 )
by filename: gen RUN = UNIQUEFem1/UNIQUE1
by filename yearsubmitted studyid: gen avfemaleB = RUN if AUTHOR == 12
by filename yearsubmitted studyid: replace avfemaleB = avfemaleB[_N]
egen SFemaleB = mean( avfemaleB), by (yearsubmitted Nresearcharea)
drop taga1 UNIQUE1 FEM1 tagFem1 UNIQUEFem1 RUN
* Revert back to wide
reshape wide
rename  groupshareofestimates authorgroupshareofestimates

** Column (3): Economics journals 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.SFemaleB if EcoJournal == 1 , absorb( yearsubmitted  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at( SFemaleB =(0(0.1)0.8))
marginsplot
** Column (4): All journals 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.SFemaleB , absorb( yearsubmitted  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at( SFemaleB =(0(0.1)0.8))
marginsplot
restore

************************************************************************************************************************************************************************************************
