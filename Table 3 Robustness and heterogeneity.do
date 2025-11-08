// The below commands reproduce Table 3 of the main article. The data for this analysis can be found in the Stata data file "Article Level Data.dta"

// New variable definitions (for definitions of the other variables see Table 2 Baseline Results.do):

first_dom_acceptance_and_submiss = binary variable = 1 if the article reports the submission month and not the actual date
Generalinterest                  = binary variable = 1 if the article is published in an economics general interest journals
EXPERIMENT						 = binary variable = 1 if the meta-analysis reports experimental research
NONECO                           = binary variable = 1 if the journal is not an economics and not a commerce/business journal (e.g. psychology, education, sociology, science and medical journals) 
HengelFEMALE                     = Hengel (2020) measure of female authorship
ONEFEM                           = binary variable = 1 if at least one author is female 
HALFFEM                          = binary variable = 1 if at least half of the authors are female  
ALLFEM                           = binary variable = 1 if all authors are female 
FirstFemale                      = binary variable = 1 if the first author is female
Alexander 						 = binary variable = 1 if the journal is included in Alexander et al. (2023) sample	
n_total_pre_top5max              = number of top five publications by the most prominent author 
n_total_pre_topeconmax           = number of non top five publications by the most prominent author

***********************************************************
*** Table 3    Gender and time to acceptance, robustness 
***********************************************************
// Panel A. TRENDS:
** Row (2) Research area specific trends
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1, absorb(acceptanceyear Njournal Nresearcharea##c.YEAR ) vce(cluster filename)
* All outlets 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors, absorb(acceptanceyear  Njournal Nresearcharea##c.YEAR ) vce(cluster filename)

** Row (3) Journal specific trends
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  propfemaleauthors if EcoJournal == 1 , absorb(acceptanceyear Njournal##c.YEAR Nresearcharea ) vce(cluster filename)
* All outlets 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  propfemaleauthors , absorb(acceptanceyear Njournal##c.YEAR Nresearcharea) vce(cluster filename)

** Row (4) Control specific trends
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime c.numberofauthors##c.YEAR c.temporal_rank##c.YEAR c.authorgroupshareofestimates##c.YEAR c.count##c.YEAR c.STATSIG##c.YEAR c.sign##c.YEAR c.ShareTop10##c.YEAR c.ShareTop20##c.YEAR c.ShareTop30##c.YEAR c.ShareTop40##c.YEAR c.ShareTop50##c.YEAR c.ShareTop60##c.YEAR c.ShareTop70##c.YEAR c.ShareTop80##c.YEAR c.ShareTop90##c.YEAR c.ShareTop100##c.YEAR c.OtherTopJournals##c.YEAR c.totaltop5##c.YEAR Unknown propfemaleauthors if EcoJournal == 1 , absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* All outlets 
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime c.numberofauthors##c.YEAR c.temporal_rank##c.YEAR c.authorgroupshareofestimates##c.YEAR c.count##c.YEAR c.STATSIG##c.YEAR c.sign##c.YEAR c.ShareTop10##c.YEAR c.ShareTop20##c.YEAR c.ShareTop30##c.YEAR c.ShareTop40##c.YEAR c.ShareTop50##c.YEAR c.ShareTop60##c.YEAR c.ShareTop70##c.YEAR c.ShareTop80##c.YEAR c.ShareTop90##c.YEAR c.ShareTop100##c.YEAR c.OtherTopJournals##c.YEAR c.totaltop5##c.YEAR Unknown propfemaleauthors, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

// Panel B. ALTERNATE SAMPLES:
** Row (5) Remove estimates without exact date
*  Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & first_dom_acceptance_and_submiss !=1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
*  All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if first_dom_acceptance_and_submiss !=1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

** Row (6) General interest journals
*  Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & Generalinterest ==1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* All journals
not applicable

** Row (7) Field journals
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & Generalinterest !=1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if Generalinterest !=1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

** Row (8) Solo-authored 
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & numberofauthors == 1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if  numberofauthors == 1, absorb(acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

** Row (9) Experimental
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1  & EXPERIMENT == 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
*  All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EXPERIMENT == 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (10) Observational 
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1  & EXPERIMENT != 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
*  All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EXPERIMENT != 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (11) Remove non-eco/commerce
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & NONECO == 0, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if NONECO == 0, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (12) Only non-eco/commerce
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if NONECO == 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (13) Pre 2000
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR < 2000, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if YEAR < 2000, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (14) 2000 to 2010
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR >= 2000 & YEAR < 2010, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if YEAR >= 2000 & YEAR < 2010, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (15) Post 2010
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if EcoJournal == 1 & YEAR >= 2010, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown propfemaleauthors if YEAR >= 2010, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

// C. ALTERNATE MEASURES OF FEMALE AUTHORSHIP:
** Row (16) Hengel measure, Female ratio above 0.5
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  HengelFEMALE if EcoJournal == 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  HengelFEMALE, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (17) At least one female
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown ONEFEM if EcoJournal == 1 , absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
*All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown ONEFEM , absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (18) At least half female
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown HALFFEM if EcoJournal == 1, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown HALFFEM, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (19) All female 
* Economics
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown ALLFEM if EcoJournal == 1 , absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown ALLFEM, absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

** Row (20) First author female
* Economics
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown FirstFemale if EcoJournal == 1 , absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown FirstFemale , absorb(acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)

// Panel D. ALTERNATIVE SPECIFICATIONS:
**  Row (21) Submission to publication
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnsubmit numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  propfemaleauthors if EcoJournal == 1 , absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnsubmit numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  propfemaleauthors, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

** Row (22) Card et al. (2020) specification; replication of TABLE VIII, Column (6), to OUR data
*** Note these authors cluster standard errors by editor. We do not have this information so we cluster by journal.
* Economics journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe acceptance_time_days numberofauthors  EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY AllPastTopEco ALLFEM MIXEDGENDER Unknown if EcoJournal == 1  , absorb( acceptanceyear Njournal  ) vce(cluster Njournal)
* All journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe acceptance_time_days numberofauthors  EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY AllPastTopEco ALLFEM MIXEDGENDER Unknown,  absorb( acceptanceyear Njournal  ) vce(cluster Njournal)

** Row (23) Hengel (2022) specification, Table 7. Hengel includes Editor fixed effects; we do not have this information. Hengel controls for the number of pages but we do not consistently have this information for our data. Order is the order in which an article appeared in an issue; we do not have this information. 
* Economics journals
bootstrap, reps(1000) cluster(yearsubmitted) idcluster(newid) seed(10201): reghdfe acceptance_time_days  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY asinh_citation numberofauthors  n_total_pre_top5max Unknown HengelFEMALE if EcoJournal == 1  , absorb( Njournal acceptanceyear  ) vce(cluster yearsubmitted)
* All journals
bootstrap, reps(1000) cluster(yearsubmitted) idcluster(newid) seed(10201): reghdfe acceptance_time_days  ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 EDUCATION HEALTH LABOUR GROWTH MACRO INTERNATIONAL FINANCE IO Micro PUBLIC ENERGY asinh_citation numberofauthors n_total_pre_top5max Unknown HengelFEMALE , absorb( Njournal acceptanceyear  ) vce(cluster yearsubmitted)

** Row (24) Alexander et al. (2023) specification, Table 2
* These authors use the gender of the corresponding author. We approximate this by the gender of the first author. 
* Economics journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe acceptance_time_days asinh_citation n_total_pre_topeconmax Unknown FirstFemale if EcoJournal == 1 , absorb(acceptanceyear Njournal) vce(cluster Njournal)
* All journals
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe acceptance_time_days asinh_citation n_total_pre_topeconmax Unknown FirstFemale, absorb(acceptanceyear Njournal) vce(cluster Njournal)

* Row (25) Alexander et al. (2023) specification on Alexander et al. sample
bootstrap, reps(1000) cluster(Njournal) idcluster(newid) seed(10201): reghdfe acceptance_time_days asinh_citation n_total_pre_topeconmax Unknown FirstFemale if Alexander == 1 , absorb(acceptanceyear Njournal) vce(cluster Njournal)



*** In text discussion (page 18). Female interacted with trends
* Economics journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.YEAR if EcoJournal == 1, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(YEAR=(1970(5)2024))
marginsplot
* All journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60 ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown c.propfemaleauthors##c.YEAR, absorb( acceptanceyear  Njournal Nresearcharea ) vce(cluster filename)
margins, dydx(propfemaleauthors) at(YEAR=(1970(5)2024))
marginsplot
**************************************************************************************************************************************************************************************************
