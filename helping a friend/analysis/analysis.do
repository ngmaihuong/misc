/*
Null hypothesis: The frequency of bargaining when purchasing has a significant impact 
on the probability of participation in informal economy.

Alternative hypothesis: The frequency of bargaining when purchasing does not have 
a significant impact on the probability of participation in informal economy.
*/

clear
set more off
capture log close
graph drop _all

ssc install outreg2

cd "/Users/Boo Boo/Downloads/Helper"
import delimited "/Users/Boo Boo/Downloads/Helper/Data/h4_data.csv", numericcols(6) encoding(ISO-8859-1)

log using Analysis/analysis.log, replace

label variable infecon "Use of Informal Economy"
label variable gender "Gender"
label variable marr "Marital Status"
label variable children "Number of children"
label variable inc_level "Income Level"
label variable sub_overc "Perception that rice is higher than should be"
label variable bargain_freq "Frequency of bargaining when purchasing"

codebook, compact

reg infecon gender, r //(1)
outreg2 using Analysis/bargain.xls, replace

reg infecon gender marr, r //(2)
outreg2 using Analysis/bargain.xls, append

reg infecon gender marr children, r //(3)
outreg2 using Analysis/bargain.xls, append

reg infecon gender marr children sub_overc, r //(4)
outreg2 using Analysis/bargain.xls, append

reg infecon gender marr children sub_overc bargain_freq, r //(5)
outreg2 using Analysis/bargain.xls, append

reg infecon gender marr children sub_overc bargain_freq inc_level, r //(6)
outreg2 using Analysis/bargain.xls, append

save Data/analysis.dta, replace

log close
exit
