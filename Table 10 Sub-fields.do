// The below commands reproduce Table 10 of the main article. The data for this analysis can be found in the file "Article Level Data.dta"

**********************************************************************
*** TABLE 10    Gender and time to acceptance, subfields, all studies
**********************************************************************
* Female authors and sub-field interactions
gen FemFINANCE      = propfemaleauthors*FINANCE
gen FemGROWTH       = propfemaleauthors*GROWTH
gen FemLABOUR       = propfemaleauthors*LABOUR
gen     MacroIntern = 0 
replace MacroIntern = 1 if MACRO ==1
replace MacroIntern = 1 if INTERNATIONAL ==1
gen FemMacroIntern  = propfemaleauthors*MacroIntern
gen     EducHealth  = 0
replace EducHealth  = 1 if EDUCATION == 1 
replace EducHealth  = 1 if HEALTH == 1 
gen FemEducHealth	= propfemaleauthors*EducHealth
gen     MicroIO     = 0
replace MicroIO     = 1 if IO ==1
replace MicroIO     = 1 if Micro == 1
gen FemMicroIO      = propfemaleauthors*MicroIO
gen OTHER = 0
replace OTHER = 1 if PUBLIC == 1
replace OTHER = 1 if ENERGY == 1
gen FemOTHER        = propfemaleauthors*OTHER

** Column (1) Proportion female authors
sum propfemaleauthors if GROWTH == 1
sum propfemaleauthors if MacroIntern == 1
sum propfemaleauthors if OTHER == 1
sum propfemaleauthors if FINANCE == 1
sum propfemaleauthors if MicroIO == 1
sum propfemaleauthors if LABOUR == 1
sum propfemaleauthors if EducHealth == 1

*** Column (1) Female and sub-field interactions, all journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime numberofauthors temporal_rank authorgroupshareofestimates count STATSIG sign ShareTop10 ShareTop20 ShareTop30 ShareTop40 ShareTop50 ShareTop60  ShareTop70 ShareTop80 ShareTop90 ShareTop100 OtherTopJournals totaltop5 Unknown  FemFINANCE FemGROWTH FemLABOUR FemMacroIntern FemEducHealth FemMicroIO FemOTHER, absorb( acceptanceyear Njournal Nresearcharea ) vce(cluster filename)

* All Female interactions = 0
test FemFINANCE = FemGROWTH = FemLABOUR = FemMacroIntern = FemEducHealth = FemMicroIO = FemOTHER = 0
* Growth vs macro
lincom FemGROWTH -  FemMacroIntern

*** All other interactions
gen AuthorFIN    = numberofauthors * FINANCE
gen AuthorGROWTH = numberofauthors*GROWTH
gen AuthorLABOUR = numberofauthors*LABOUR
gen AuthorEduc = numberofauthors*EducHealth
gen AuthorMACRO  =  numberofauthors*MacroIntern
gen AuthorPUBLIC =  numberofauthors*OTHER
gen AuthorMicro = numberofauthors*MicroIO

gen temporalFIN     = temporal_rank * FINANCE
gen temporalGROWTH  = temporal_rank*GROWTH
gen temporalLABOUR  = temporal_rank*LABOUR
gen temporalEduc = temporal_rank*EducHealth
gen temporalMicro   = temporal_rank*MicroIO
gen temporalMACRO   = temporal_rank*MacroIntern
gen temporalPUBLIC  = temporal_rank*OTHER

gen countFIN = count * FINANCE
gen countGROWTH = count*GROWTH
gen countLABOUR = count*LABOUR
gen countEduc = count*EducHealth
gen countMicro = count*MicroIO
gen countMACRO = count*MacroIntern
gen countPUBLIC = count*OTHER

gen STATSIGFIN = STATSIG * FINANCE
gen STATSIGGROWTH = STATSIG*GROWTH
gen STATSIGLABOUR = STATSIG*LABOUR
gen STATSIGEduc = STATSIG*EducHealth
gen STATSIGMicro = STATSIG*MicroIO
gen STATSIGMACRO = STATSIG*MacroIntern
gen STATSIGPUBLIC = STATSIG*OTHER

gen signFIN = sign * FINANCE
gen signGROWTH = sign*GROWTH
gen signLABOUR = sign*LABOUR
gen signEduc = sign*EducHealth
gen signMicro= sign*MicroIO
gen signMACRO= sign*MacroIntern
gen signPUBLIC= sign*OTHER

gen totaltop5FIN = totaltop5 * FINANCE
gen totaltop5GROWTH = totaltop5*GROWTH
gen totaltop5LABOUR = totaltop5*LABOUR
gen totaltop5Educ = totaltop5*EducHealth
gen totaltop5Micro = totaltop5*MicroIO
gen totaltop5MACRO = totaltop5*MacroIntern
gen totaltop5PUBLIC = totaltop5*OTHER

gen OtherTopJournalsFIN = OtherTopJournals * FINANCE
gen OtherTopJournalsGROWTH = OtherTopJournals*GROWTH
gen OtherTopJournalsLABOUR = OtherTopJournals*LABOUR
gen OtherTopJournalsEduc = OtherTopJournals*EducHealth
gen OtherTopJournalsMicro = OtherTopJournals*MicroIO
gen OtherTopJournalsMACRO = OtherTopJournals*MacroIntern
gen OtherTopJournalsPUBLIC = OtherTopJournals*OTHER

gen autshareFIN = authorgroupshareofestimates  * FINANCE
gen autshareGROWTH = authorgroupshareofestimates *GROWTH
gen autshareLABOUR = authorgroupshareofestimates *LABOUR
gen autshareEduc = authorgroupshareofestimates *EducHealth
gen autshareMicro = authorgroupshareofestimates *MicroIO
gen autshareMACRO = authorgroupshareofestimates *MacroIntern
gen autsharePUBLIC = authorgroupshareofestimates *OTHER

gen ShareTop10FIN = ShareTop10 * FINANCE
gen ShareTop10GROWTH = ShareTop10*GROWTH
gen ShareTop10LABOUR = ShareTop10*LABOUR
gen ShareTop10Educ = ShareTop10*EducHealth
gen ShareTop10Micro = ShareTop10*MicroIO
gen ShareTop10MACRO = ShareTop10*MacroIntern
gen ShareTop10PUBLIC = ShareTop10*OTHER

gen ShareTop20FIN = ShareTop20 * FINANCE
gen ShareTop20GROWTH = ShareTop20*GROWTH
gen ShareTop20LABOUR = ShareTop20*LABOUR
gen ShareTop20Educ = ShareTop20*EducHealth
gen ShareTop20Micro = ShareTop20*MicroIO
gen ShareTop20MACRO = ShareTop20*MacroIntern
gen ShareTop20PUBLIC = ShareTop20*OTHER

gen ShareTop30FIN = ShareTop30 * FINANCE
gen ShareTop30GROWTH = ShareTop30*GROWTH
gen ShareTop30LABOUR = ShareTop30*LABOUR
gen ShareTop30Educ = ShareTop30*EducHealth
gen ShareTop30Micro = ShareTop30*MicroIO
gen ShareTop30MACRO = ShareTop30*MacroIntern
gen ShareTop30PUBLIC = ShareTop30*OTHER

gen ShareTop40FIN = ShareTop40 * FINANCE
gen ShareTop40GROWTH = ShareTop40*GROWTH
gen ShareTop40LABOUR = ShareTop40*LABOUR
gen ShareTop40Educ = ShareTop40*EducHealth
gen ShareTop40Micro = ShareTop40*MicroIO
gen ShareTop40MACRO = ShareTop40*MacroIntern
gen ShareTop40PUBLIC = ShareTop40*OTHER

gen ShareTop50FIN = ShareTop50 * FINANCE
gen ShareTop50GROWTH = ShareTop50*GROWTH
gen ShareTop50LABOUR = ShareTop50*LABOUR
gen ShareTop50Educ = ShareTop50*EducHealth
gen ShareTop50Micro = ShareTop50*MicroIO
gen ShareTop50MACRO = ShareTop50*MacroIntern
gen ShareTop50PUBLIC = ShareTop50*OTHER

gen ShareTop60FIN = ShareTop60 * FINANCE
gen ShareTop60GROWTH = ShareTop60*GROWTH
gen ShareTop60LABOUR = ShareTop60*LABOUR
gen ShareTop60Educ = ShareTop60*EducHealth
gen ShareTop60Micro = ShareTop60*MicroIO
gen ShareTop60MACRO = ShareTop60*MacroIntern
gen ShareTop60PUBLIC = ShareTop60*OTHER

gen ShareTop70FIN = ShareTop70 * FINANCE
gen ShareTop70GROWTH = ShareTop70*GROWTH
gen ShareTop70LABOUR = ShareTop70*LABOUR
gen ShareTop70Educ = ShareTop70*EducHealth
gen ShareTop70Micro = ShareTop70*MicroIO
gen ShareTop70MACRO = ShareTop70*MacroIntern
gen ShareTop70PUBLIC = ShareTop70*OTHER

gen ShareTop80FIN = ShareTop80 * FINANCE
gen ShareTop80GROWTH = ShareTop80*GROWTH
gen ShareTop80LABOUR = ShareTop80*LABOUR
gen ShareTop80Educ = ShareTop80*EducHealth
gen ShareTop80Micro = ShareTop80*MicroIO
gen ShareTop80MACRO = ShareTop80*MacroIntern
gen ShareTop80PUBLIC = ShareTop80*OTHER

gen ShareTop90FIN = ShareTop90 * FINANCE
gen ShareTop90GROWTH = ShareTop90*GROWTH
gen ShareTop90LABOUR = ShareTop90*LABOUR
gen ShareTop90Educ = ShareTop90*EducHealth
gen ShareTop90Micro = ShareTop90*MicroIO
gen ShareTop90MACRO = ShareTop90*MacroIntern
gen ShareTop90PUBLIC = ShareTop90*OTHER

gen ShareTop100FIN = ShareTop100 * FINANCE
gen ShareTop100GROWTH = ShareTop100*GROWTH
gen ShareTop100LABOUR = ShareTop100*LABOUR
gen ShareTop100Educ = ShareTop100*EducHealth
gen ShareTop100Micro = ShareTop100*MicroIO
gen ShareTop100MACRO = ShareTop100*MacroIntern
gen ShareTop100PUBLIC = ShareTop100*OTHER

*** Column (2), Sub-field interactions with all control variables
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  ShareTop10FIN ShareTop20FIN ShareTop30FIN ShareTop40FIN ShareTop50FIN ShareTop60FIN  ShareTop70FIN ShareTop80FIN ShareTop90FIN ShareTop100FIN ShareTop10GROWTH ShareTop20GROWTH ShareTop30GROWTH ShareTop40GROWTH ShareTop50GROWTH ShareTop60GROWTH  ShareTop70GROWTH ShareTop80GROWTH ShareTop90GROWTH ShareTop100GROWTH ShareTop10LABOUR ShareTop20LABOUR ShareTop30LABOUR ShareTop40LABOUR ShareTop50LABOUR ShareTop60LABOUR  ShareTop70LABOUR ShareTop80LABOUR ShareTop90LABOUR ShareTop100LABOUR ShareTop10MACRO ShareTop20MACRO ShareTop30MACRO ShareTop40MACRO ShareTop50MACRO ShareTop60MACRO  ShareTop70MACRO ShareTop80MACRO ShareTop90MACRO ShareTop100MACRO  ShareTop10Educ  ShareTop20Educ  ShareTop30Educ  ShareTop40Educ  ShareTop50Educ  ShareTop60Educ  ShareTop70Educ  ShareTop80Educ  ShareTop90Educ  ShareTop100Educ  ShareTop10Micro ShareTop20Micro ShareTop30Micro ShareTop40Micro ShareTop50Micro ShareTop60Micro ShareTop70Micro ShareTop80Micro ShareTop90Micro ShareTop100Micro  ShareTop10PUBLIC ShareTop20PUBLIC ShareTop30PUBLIC ShareTop40PUBLIC ShareTop50PUBLIC ShareTop60PUBLIC  ShareTop70PUBLIC ShareTop80PUBLIC ShareTop90PUBLIC ShareTop100PUBLIC Unknown autshareFIN autshareGROWTH autshareLABOUR autshareMACRO  autshareEduc autshareMicro autsharePUBLIC  AuthorFIN AuthorGROWTH AuthorLABOUR AuthorMACRO AuthorEduc AuthorMicro AuthorPUBLIC  temporalFIN temporalGROWTH temporalLABOUR temporalMACRO  temporalEduc temporalMicro temporalPUBLIC countFIN countGROWTH countLABOUR countMACRO  countEduc countMicro  countPUBLIC  signFIN signGROWTH signLABOUR signMACRO  signEduc signMicro signPUBLIC STATSIGFIN STATSIGGROWTH STATSIGLABOUR STATSIGMACRO  STATSIGEduc  STATSIGMicro STATSIGPUBLIC  totaltop5FIN totaltop5GROWTH totaltop5LABOUR totaltop5MACRO  totaltop5Educ  totaltop5Micro totaltop5PUBLIC  OtherTopJournalsFIN OtherTopJournalsGROWTH OtherTopJournalsLABOUR OtherTopJournalsMACRO  OtherTopJournalsEduc   OtherTopJournalsMicro OtherTopJournalsPUBLIC  FemFINANCE FemGROWTH FemLABOUR FemMacroIntern FemEducHealth FemMicroIO FemOTHER, absorb( acceptanceyear Njournal Nresearcharea) vce(cluster filename)

* All Female interactions = 0
test FemFINANCE = FemGROWTH = FemLABOUR = FemMacroIntern = FemEducHealth = FemMicroIO = FemOTHER = 0
* Growth vs macro
lincom FemGROWTH -  FemMacroIntern

*** Column (3), All interactions
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  ShareTop10FIN ShareTop20FIN ShareTop30FIN ShareTop40FIN ShareTop50FIN ShareTop60FIN  ShareTop70FIN ShareTop80FIN ShareTop90FIN ShareTop100FIN ShareTop10GROWTH ShareTop20GROWTH ShareTop30GROWTH ShareTop40GROWTH ShareTop50GROWTH ShareTop60GROWTH  ShareTop70GROWTH ShareTop80GROWTH ShareTop90GROWTH ShareTop100GROWTH ShareTop10LABOUR ShareTop20LABOUR ShareTop30LABOUR ShareTop40LABOUR ShareTop50LABOUR ShareTop60LABOUR  ShareTop70LABOUR ShareTop80LABOUR ShareTop90LABOUR ShareTop100LABOUR ShareTop10MACRO ShareTop20MACRO ShareTop30MACRO ShareTop40MACRO ShareTop50MACRO ShareTop60MACRO  ShareTop70MACRO ShareTop80MACRO ShareTop90MACRO ShareTop100MACRO  ShareTop10Educ  ShareTop20Educ  ShareTop30Educ  ShareTop40Educ  ShareTop50Educ  ShareTop60Educ  ShareTop70Educ  ShareTop80Educ  ShareTop90Educ  ShareTop100Educ  ShareTop10Micro ShareTop20Micro ShareTop30Micro ShareTop40Micro ShareTop50Micro ShareTop60Micro ShareTop70Micro ShareTop80Micro ShareTop90Micro ShareTop100Micro  ShareTop10PUBLIC ShareTop20PUBLIC ShareTop30PUBLIC ShareTop40PUBLIC ShareTop50PUBLIC ShareTop60PUBLIC  ShareTop70PUBLIC ShareTop80PUBLIC ShareTop90PUBLIC ShareTop100PUBLIC Unknown autshareFIN autshareGROWTH autshareLABOUR autshareMACRO  autshareEduc autshareMicro autsharePUBLIC  AuthorFIN AuthorGROWTH AuthorLABOUR AuthorMACRO AuthorEduc AuthorMicro AuthorPUBLIC  temporalFIN temporalGROWTH temporalLABOUR temporalMACRO  temporalEduc temporalMicro temporalPUBLIC countFIN countGROWTH countLABOUR countMACRO  countEduc countMicro  countPUBLIC  signFIN signGROWTH signLABOUR signMACRO  signEduc signMicro signPUBLIC STATSIGFIN STATSIGGROWTH STATSIGLABOUR STATSIGMACRO  STATSIGEduc  STATSIGMicro STATSIGPUBLIC  totaltop5FIN totaltop5GROWTH totaltop5LABOUR totaltop5MACRO  totaltop5Educ  totaltop5Micro totaltop5PUBLIC  OtherTopJournalsFIN OtherTopJournalsGROWTH OtherTopJournalsLABOUR OtherTopJournalsMACRO  OtherTopJournalsEduc   OtherTopJournalsMicro OtherTopJournalsPUBLIC  FemFINANCE FemGROWTH FemLABOUR FemMacroIntern FemEducHealth FemMicroIO FemOTHER, absorb( GROWTH#acceptanceyear GROWTH#Njournal GROWTH#Nresearcharea LABOUR#acceptanceyear LABOUR#Njournal LABOUR#Nresearcharea MicroIO#acceptanceyear MicroIO#Njournal MicroIO#Nresearcharea MacroIntern#acceptanceyear MacroIntern#Njournal MacroIntern#Nresearcharea FINANCE#acceptanceyear FINANCE#Njournal FINANCE#Nresearcharea OTHER#acceptanceyear OTHER#Njournal OTHER#Nresearcharea EducHealth#acceptanceyear EducHealth#Njournal EducHealth#Nresearcharea ) vce(cluster filename)

* All Female interactions = 0
test FemFINANCE = FemGROWTH = FemLABOUR = FemMacroIntern = FemEducHealth = FemMicroIO = FemOTHER = 0
* Growth vs macro
lincom FemGROWTH -  FemMacroIntern


** In text discussion, same journals, all years
gen     SameJournal = 0
replace SameJournal = 1 if journal == "Asia pacific economic literature"
replace SameJournal = 1 if journal == "Cambridge journal of economics"
replace SameJournal = 1 if journal == "China economic review"
replace SameJournal = 1 if journal == "Cliometrica"
replace SameJournal = 1 if journal == "Defence and peace economics"
replace SameJournal = 1 if journal == "Ecological economics"
replace SameJournal = 1 if journal == "Econometrica"
replace SameJournal = 1 if journal == "Economic analysis and policy"
replace SameJournal = 1 if journal == "Economic change and restructuring"
replace SameJournal = 1 if journal == "Economic inquiry"
replace SameJournal = 1 if journal == "Economic modelling"
replace SameJournal = 1 if journal == "Economic systems"
replace SameJournal = 1 if journal == "Economics bulletin"
replace SameJournal = 1 if journal == "Economics letters"
replace SameJournal = 1 if journal == "Economics of innovation and new technology"
replace SameJournal = 1 if journal == "Economics of transition and institutional change"
replace SameJournal = 1 if journal == "Emerging markets review"
replace SameJournal = 1 if journal == "Empirical economics"
replace SameJournal = 1 if journal == "Energy economics"
replace SameJournal = 1 if journal == "Environment and planning a: economy and space"
replace SameJournal = 1 if journal == "Environment and planning c: government and policy"
replace SameJournal = 1 if journal == "European economic review"
replace SameJournal = 1 if journal == "European journal of political economy"
replace SameJournal = 1 if journal == "Growth and change"
replace SameJournal = 1 if journal == "Hitotsubashi journal of economics"
replace SameJournal = 1 if journal == "International advances in economic research"
replace SameJournal = 1 if journal == "International business review"
replace SameJournal = 1 if journal == "International economic journal"
replace SameJournal = 1 if journal == "International journal of financial studies"
replace SameJournal = 1 if journal == "International review of financial analysis"
replace SameJournal = 1 if journal == "Japan and the world economy"
replace SameJournal = 1 if journal == "Journal of african economies"
replace SameJournal = 1 if journal == "Journal of applied econometrics"
replace SameJournal = 1 if journal == "Journal of applied economics"
replace SameJournal = 1 if journal == "Journal of asian economics"
replace SameJournal = 1 if journal == "Journal of banking and finance"
replace SameJournal = 1 if journal == "Journal of business economics and management"
replace SameJournal = 1 if journal == "Journal of comparative economics"
replace SameJournal = 1 if journal == "Journal of development economics"
replace SameJournal = 1 if journal == "Journal of economic behavior and organization"
replace SameJournal = 1 if journal == "Journal of economic development"
replace SameJournal = 1 if journal == "Journal of economic geography"
replace SameJournal = 1 if journal == "Journal of economic integration"
replace SameJournal = 1 if journal == "Journal of economic studies"
replace SameJournal = 1 if journal == "Journal of economics and business"
replace SameJournal = 1 if journal == "Journal of financial economics"
replace SameJournal = 1 if journal == "Journal of human resources"
replace SameJournal = 1 if journal == "Journal of international economics"
replace SameJournal = 1 if journal == "Journal of labor economics"
replace SameJournal = 1 if journal == "Journal of macroeconomics"
replace SameJournal = 1 if journal == "Journal of monetary economics"
replace SameJournal = 1 if journal == "Journal of money credit and banking"
replace SameJournal = 1 if journal == "Journal of politics"
replace SameJournal = 1 if journal == "Journal of public economics"
replace SameJournal = 1 if journal == "Journal of regional science"
replace SameJournal = 1 if journal == "Journal of the japanese and international economies"
replace SameJournal = 1 if journal == "Journal of urban economics"
replace SameJournal = 1 if journal == "Labour economics"
replace SameJournal = 1 if journal == "Latin american economic review"
replace SameJournal = 1 if journal == "Macroeconomics and finance in emerging market economies"
replace SameJournal = 1 if journal == "Manchester school"
replace SameJournal = 1 if journal == "Metroeconomica"
replace SameJournal = 1 if journal == "Papers in regional science"
replace SameJournal = 1 if journal == "Public choice"
replace SameJournal = 1 if journal == "Quarterly review of economics and finance"
replace SameJournal = 1 if journal == "Regional science and urban economics"
replace SameJournal = 1 if journal == "Regional studies"
replace SameJournal = 1 if journal == "Research in economics"
replace SameJournal = 1 if journal == "Research in social stratification and mobility"
replace SameJournal = 1 if journal == "Research policy"
replace SameJournal = 1 if journal == "Resource and energy economics"
replace SameJournal = 1 if journal == "Science"
replace SameJournal = 1 if journal == "Southern economic journal"
replace SameJournal = 1 if journal == "Spatial economic analysis"
replace SameJournal = 1 if journal == "Structural change and economic dynamics"
replace SameJournal = 1 if journal == "The annals of regional science"
replace SameJournal = 1 if journal == "The economic journal"
replace SameJournal = 1 if journal == "The review of economic studies"
replace SameJournal = 1 if journal == "The review of economics and statistics"
replace SameJournal = 1 if journal == "Tijdschrift voor economische en sociale geografie"
replace SameJournal = 1 if journal == "Urban studies"

* Growth vs Macro comparison for the same journals
bootstrap, reps(1000) cluster(filename) idcluster(newid) seed(10201): reghdfe lnacceptancetime  ShareTop10FIN ShareTop20FIN ShareTop30FIN ShareTop40FIN ShareTop50FIN ShareTop60FIN  ShareTop70FIN ShareTop80FIN ShareTop90FIN ShareTop100FIN ShareTop10GROWTH ShareTop20GROWTH ShareTop30GROWTH ShareTop40GROWTH ShareTop50GROWTH ShareTop60GROWTH  ShareTop70GROWTH ShareTop80GROWTH ShareTop90GROWTH ShareTop100GROWTH ShareTop10LABOUR ShareTop20LABOUR ShareTop30LABOUR ShareTop40LABOUR ShareTop50LABOUR ShareTop60LABOUR  ShareTop70LABOUR ShareTop80LABOUR ShareTop90LABOUR ShareTop100LABOUR ShareTop10MACRO ShareTop20MACRO ShareTop30MACRO ShareTop40MACRO ShareTop50MACRO ShareTop60MACRO  ShareTop70MACRO ShareTop80MACRO ShareTop90MACRO ShareTop100MACRO  ShareTop10Educ  ShareTop20Educ  ShareTop30Educ  ShareTop40Educ  ShareTop50Educ  ShareTop60Educ  ShareTop70Educ  ShareTop80Educ  ShareTop90Educ  ShareTop100Educ  ShareTop10Micro ShareTop20Micro ShareTop30Micro ShareTop40Micro ShareTop50Micro ShareTop60Micro ShareTop70Micro ShareTop80Micro ShareTop90Micro ShareTop100Micro  ShareTop10PUBLIC ShareTop20PUBLIC ShareTop30PUBLIC ShareTop40PUBLIC ShareTop50PUBLIC ShareTop60PUBLIC  ShareTop70PUBLIC ShareTop80PUBLIC ShareTop90PUBLIC ShareTop100PUBLIC Unknown autshareFIN autshareGROWTH autshareLABOUR autshareMACRO  autshareEduc autshareMicro autsharePUBLIC  AuthorFIN AuthorGROWTH AuthorLABOUR AuthorMACRO AuthorEduc AuthorMicro AuthorPUBLIC  temporalFIN temporalGROWTH temporalLABOUR temporalMACRO  temporalEduc temporalMicro temporalPUBLIC countFIN countGROWTH countLABOUR countMACRO  countEduc countMicro  countPUBLIC  signFIN signGROWTH signLABOUR signMACRO  signEduc signMicro signPUBLIC STATSIGFIN STATSIGGROWTH STATSIGLABOUR STATSIGMACRO  STATSIGEduc  STATSIGMicro STATSIGPUBLIC  totaltop5FIN totaltop5GROWTH totaltop5LABOUR totaltop5MACRO  totaltop5Educ  totaltop5Micro totaltop5PUBLIC  OtherTopJournalsFIN OtherTopJournalsGROWTH OtherTopJournalsLABOUR OtherTopJournalsMACRO  OtherTopJournalsEduc   OtherTopJournalsMicro OtherTopJournalsPUBLIC  FemFINANCE FemGROWTH FemLABOUR FemMacroIntern FemEducHealth FemMicroIO FemOTHER if SameJournal == 1, absorb( GROWTH#acceptanceyear GROWTH#Njournal GROWTH#Nresearcharea LABOUR#acceptanceyear LABOUR#Njournal LABOUR#Nresearcharea MicroIO#acceptanceyear MicroIO#Njournal MicroIO#Nresearcharea MacroIntern#acceptanceyear MacroIntern#Njournal MacroIntern#Nresearcharea FINANCE#acceptanceyear FINANCE#Njournal FINANCE#Nresearcharea OTHER#acceptanceyear OTHER#Njournal OTHER#Nresearcharea EducHealth#acceptanceyear EducHealth#Njournal EducHealth#Nresearcharea ) vce(cluster filename)

* All Female interactions = 0
test FemFINANCE = FemGROWTH = FemLABOUR = FemMacroIntern = FemEducHealth = FemMicroIO = FemOTHER = 0
* Growth vs macro
lincom FemGROWTH -  FemMacroIntern


*** Figure 5
twoway (rcap lower upper row , horizontal ylabel(1 "Finance" 2 "Growth" 3 "Labour" 4 "EdHealth" 5 "MicroIO"  6 "Other" 7 "Macro" , angle(0))) (scatter row mean)

**************************************************************************************************************************************************************************************************
