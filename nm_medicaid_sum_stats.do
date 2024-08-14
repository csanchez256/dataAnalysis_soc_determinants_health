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

***estpost - Is used to make results from non-"e-class" commands available for
tabulation with "esttab" or "estout". Typically commands that perform estimations
like (regress, logit, etc.) store results in "e()" e-class. Commands that don't 
do this such as "summarize" store their results in "r()" r-class, which are not
accessible by "esttab" or "estout". So estpost solves this problem by allowing 
you to9 capture the output of non-estimation commands and store them in a format
that can be tabulated by "esttab" or "estout".


===
*/


// run summary statistics, and make it available for tabulation with esttab
estpost sum Medicaid medicare health_insurance_job no_health_insruance lgbtq us_born income ///
hours_worked spanish_home edu_nohs edu_somecol edu_trade deny_service not_treatment  


//esttab ., cells("mean sd count") noobs
//esttab, cells("mean sd min max") nomtitle nonumber
//esttab using summary_table.tex, replace label nostar title("Descriptive Statistics Summary"\label{tab1})

/*
esttab using summary_table.tex, replace tex label title("Descriptive Statistics Summary") ///
cells("mean sd min max") noobs
*/

esttab using summary_table.tex, replace tex label title("Descriptive Statistics Summary") ///
cells("mean sd min max") noobs star se p addnotes("Significance levels: \sym{*} \(p<0.05\), \sym{**} \(p<0.01\), \sym{***} \(p<0.001\)")

