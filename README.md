# Raw Data
## Climate Change Legislation
This was sourced from [Climate.org](https://climate-laws.org/). By filing out the [Data Download Request](https://eu-submit.jotform.com/233131638610347), you can download the entire database of climate legislation they have on record. My date of download was 3/27/2024. The resulting dataset is stored as climate_change_legislation.csv in the Raw Data folder. For more information about the data dictionary, methodology and citation, please visit Climate.org's [Online README](https://climatepolicyradar.notion.site/Readme-for-document-data-download-f2d55b7e238941b59559b9b1c4cc52c5)
## Global Price of Crude Oil
This was sourced from the [EIA Database](https://www.eia.gov/dnav/pet/pet_pri_spt_s1_d.htm). Average monthly spot prices for [Brent Europe](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=RBRTE&f=M) was chosen because Brent Crude is often considered the global benchmark for oil, and roughly two-thirds of the world's oil is priced off Brent Crude futures. The resulting download is saved in europe_brent_spot_price.csv in the Raw Data folder.
## Global Quantity of Crude Oil Traded
This was sourced from [The JODI Oil World Database](https://www.jodidata.org/oil/). In their ["Oil" Folder](http://www.jodidb.org/ReportFolders/reportFolders.aspx?sCS_referer=&sCS_ChosenLang=en), there is a table called "Joint Organisations Data Initiative - Primary (all data)". In the table viewer, setting the Product option to "Crude Oil" and the BALANCE option to "Imports" replicates the raw data found in the three files:
- trade_quantity_data_first_batch.csv
- trade_quantity_data_second_batch.csv
- trade_quantity_data_third_batch.csv
These files were downloaded separately by date because there is a limit on the number of cells that can be downloaded at a time.

# Data Processing
## Climate Change Legislation
## Global Price of Crude Oil
## Global Quantity of Crude Oil Traded

# Analyses
