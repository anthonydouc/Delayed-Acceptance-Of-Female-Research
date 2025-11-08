** This command is used to convert the file "Estimate Level Data.dta" into the file "Article Level Data.dta".

preserve
collapse (firstnm) journal filename gender1 gender2 gender3 gender4 gender5 gender6 gender7 gender8 gender9 gender10 gender11 gender12 author1 author2 author3 author4 author5 author6 author7 author8 author9 author10 author11 author12 (mean) citationZscore citationZscoreJo5 acceptance_time_days acceptance_time_weeks lnacceptancetime Generalinterest STATSIG  yearsubmitted nfemaleauthors numberofauthors temporal_rank authorgroupshareofestimates sign first_dom_acceptance_and_submiss propfemaleauthors EXPERIMENT effectsize  count YEAR EcoJournal Unknown ONEFEM ALLFEM HALFFEM FirstFemale MIXEDGENDER HengelFEMALE EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY  asinh_citation ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 lnsubmit asinh_citation5 Hengel Card2020 Alexander totaltop5 acceptanceyear NONECO n_total_premax n_total_pre_top5max numberofuniqueeditors propneweditors propoffemaleeditors AllPastTopEco novelty_keywords nov_sem_dist_arts2025 n_total_pre_topeconmax recenttopeco futuretopeco past4yearsall99  futureall99 if lnacceptancetime !=. , by(studyid)

encode journal, gen(Njournal)
encode filename, gen(Nresearcharea)

replace propfemaleauthors   = round(propfemaleauthors, 0.0001)
replace propneweditors      = round( propneweditors , 0.0001)
replace propoffemaleeditors = round( propoffemaleeditors , 0.0001)
gen OtherTopJournals = AllPastTopEco - totaltop5

*****************************************************************************************************************************