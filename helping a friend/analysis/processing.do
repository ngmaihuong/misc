clear
set more off
capture log close
graph drop _all

cd "/Users/Boo Boo/Downloads/Helper"
import excel "/Users/Boo Boo/Downloads/Helper/Data/Data.xlsx", sheet("RAWDATA") firstrow

log using Analysis/processing.log, replace

label variable infecon "Use of Informal Economy"
label variable tot_motv "Total Motives"
label variable main_motv "Main Motives"
label variable age "Age"
label variable gender "Gender"
label variable marr "Marital Status"
label variable children "Number of children"
label variable emp "Occupation"
label variable mon_inc "Monthly Income"
label variable address "Address"
label variable address_len "Time in Address"
label variable tax_mor "Tax Morality"
label variable tax_evd "Tax Obligation Evaded"
label variable cash_perc "Percentage of Cash in All Transactions"
label variable where_cash "Where use cash"
label variable where_nocash "Where cashless"
label variable sub_overc "Perception that rice is higher than should be"
label variable bargain_freq "Frequency of bargaining when purchasing"
label variable online_freq "Online purchaing frequency"

codebook, compact

save Data/processing.dta, replace

log close
exit
