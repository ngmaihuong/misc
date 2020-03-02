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


cd "/Users/Boo Boo/Downloads/Helper"
import delimited "/Users/Boo Boo/Downloads/Helper/Data/clean_data.csv", encoding(ISO-8859-1)

log using Analysis/processing1.log, replace

keep infecon gender marr children inc_level sub_overc bargain_freq

save Data/processing1.dta, replace

log close
exit
