# Overview
This project is a first attempt at estimating the supply function of the global oil commodity market. Dependent variable is quantity traded, main explanatory variable is price, and the instrumental variable is the number of climate change legislation (a demand shock).

# Raw Data
## Climate Change Legislation
This was sourced from [Climate.org](https://climate-laws.org/). By filling out the [Data Download Request](https://eu-submit.jotform.com/233131638610347), you can download the entire database of climate legislation they have on record. My date of download was 3/27/2024. The resulting dataset is stored as climate_change_legislation.csv in the Raw Data folder. For more information about the data dictionary, methodology and citation, please visit Climate.org's [Online README](https://climatepolicyradar.notion.site/Readme-for-document-data-download-f2d55b7e238941b59559b9b1c4cc52c5)
## Global Price of Crude Oil
This was sourced from the [EIA Database](https://www.eia.gov/dnav/pet/pet_pri_spt_s1_d.htm). Average monthly spot prices for [Brent Europe](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=RBRTE&f=M) was chosen because Brent Crude is often considered the global benchmark for oil, and roughly two-thirds of the world's oil is priced off Brent Crude futures. The resulting download is saved in europe_brent_spot_price.csv in the Raw Data folder.
## Global Quantity of Crude Oil Traded
This was sourced from [The JODI Oil World Database](https://www.jodidata.org/oil/). In their ["Oil" Folder](http://www.jodidb.org/ReportFolders/reportFolders.aspx?sCS_referer=&sCS_ChosenLang=en), there is a table called "Joint Organisations Data Initiative - Primary (all data)". In the table viewer, setting the Product option to "Crude Oil" and the BALANCE option to "Imports" replicates the raw data found in the three files:
- trade_quantity_data_first_batch.csv
- trade_quantity_data_second_batch.csv
- trade_quantity_data_third_batch.csv

These files were downloaded separately by date because there is a limit on the number of cells that can be downloaded at a time.

# Data Processing
## Cleaning Legislation Data
See the "clean_legislation_data.r" file in the Code folder. The "Last.event.in.timeline" column is used to determine when the policy has been fully implemented. Therefore, filteration and aggregation is based on this column.

## Cleaning Price Data
See the "clean_price_data.r" file in the Code folder.

## Cleaning Quantity Data
See the "clean_quantity_data.r" file in the Code folder.

## Merging Legislation, Price, and Quantity Data
See the "merge_cleaned_data.r" file in the Code folder.

# Analyses
## Figures
Five exploratory figures examining the time trends and the co-variate trends are plotted. See the "make_figures.r" file in the Code folder, and the corresponding outputs in the Output folder.

## Regressions
There are four regressions in total. The first two include the outliers in the quantity data, while the last two are without the outliers.
For each case, the regressions were run with and without the instrumental variable (legislation count). See the "run_regressions.r" file in the Code folder.

## Possible Improvements
- The models are still underspecified; the sign of the coefficient of price does not conform to theory and the models' R-squared values are strikingly low. Inclusion of a set of control variables may be warranted.
- More granular data is needed. Daily frequency would be ideal.
- Auto-correlation due to the time-varying nature of the data needs to be accounted for. The inclusion of some lagged control variables may be useful.
- The strength of the instrumental variable still needs to be tested.
