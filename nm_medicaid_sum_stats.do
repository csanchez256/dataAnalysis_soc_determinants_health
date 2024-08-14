/*
============================
Author: Christopher Sanchez
Documentation: https://repec.sowi.unibe.ch/stata/estout/estpost.html
============================
*/

capture log close
log using "C:\Users\css7c\OneDrive\Desktop\NM Paper Datasests 7.14.24\SUMMARY_STATISTICS\a.log", replace

clear all
set more off

cd "C:\Users\css7c\OneDrive\Desktop\NM Paper Datasests 7.14.24\SUMMARY_STATISTICS\"

use "nm_clean.dta"

/*
sum Medicaid medicare health_insurance_job no_health_insruance lgbtq us_born income ///
hours_worked spanish_home edu_nohs edu_somecol edu_trade deny_service not_treatment 
*/

/*
===
NOTE: 'e()' means "e-class". These are vectors that store the results of your
regression. these results can later be stored in memory and the later
accessed and used. Then the job of esttab and estout is to tabulate these results 
or values of e().

What is esttab, estout, eststo?

***esttab - is a command used for creating formatted tables of results. It's part
of the 'estout' package. It can take results from 'reg' 'logit' 'probit' and produce
nice formatted tables that include summary statistics. 'esttab' can export tables
in multiple formats, LaTex, HTML, and Word documents. the basic syntax is:
esttab [name_list] [using filename] [, options]

***estout is also a command that provides a way to format, and export the tables

Both are in similar ways except "esttab" is more simple and straightforward for 
creating summary statistics. "estout" is used for more detailed customization 
formatting.

***eststo is a command used to store results of an estimation (regress, logit, etc.)
in memory. Once these values are stored, they can be used by "esttab" or "estout"
the results are stored in "e()".

NOTE: 'e()' means "e-class". These are vectors that store the results of your
regression. these results can later be stored in memory and the later
accessed and used. Then the job of esttab and estout is to tabulate these results 
or values of e().


fgdfdf
===
*/


/*
estpost sum Medicaid medicare health_insurance_job no_health_insruance lgbtq us_born income ///
hours_worked spanish_home edu_nohs edu_somecol edu_trade deny_service not_treatment 
*/


//esttab ., cells("mean sd count") noobs
//esttab, cells("mean sd min max") nomtitle nonumber

//esttab using summary_table.tex, replace

/*
esttab using summary_table.tex, replace ///
tex ///
label
//title("Descriptive Statistics Summary") label
*/

// Summary statistics can also be posted by estpost tabstat. 
//esttab, cells("medicaid medicare health_insurance_job") nomtitle nonumber

// Now to create a table to be included in a LaTex document
eststo: regress Medicaid medicare health_insurance_job no_health_insruance lgbtq us_born income ///
hours_worked spanish_home edu_nohs edu_somecol edu_trade deny_service not_treatment 
