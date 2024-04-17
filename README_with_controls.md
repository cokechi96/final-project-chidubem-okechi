# Overview
This project is a first attempt at estimating the supply function of the global oil commodity market. Dependent variable is quantity traded, main explanatory variable is price, and the instrumental variable is the number of climate change legislation (a demand shock).

# Raw Data
The raw data was manually generated (via Excel) due to time constraints. The resulting processed data is titled, "manually_processed_data.csv" in the Input folder, and it is referenced in the "run_regressions_with_controls.r" and "run_regressions_with_interpol_data.r" files. The raw data files from which the data is derived are all located in the Raw Data folder. Below is the summary of the data sources.
## Quantity
The raw file named "T52" was downloaded from [OPEC Website](https://asb.opec.org/data/ASB_Data.php) by checking "Table 5.2: World crude oil exports by country". 
## Price
The raw file named "statistic_id262860_brent-crude-oil-price-annually-1976-2024" was downloaded from [Statista Website](https://www.statista.com/statistics/262860/uk-brent-crude-oil-price-changes-since-1976/).
## Renewable Energy Share
The raw file named "renewable-share-energy" was downloaded from [OurWorldinData Website](https://ourworldindata.org/renewable-energy). The relevant figure on the page is titled "Share of primary energy consumption from renewable sources, 2022". To match the processed data, filter to Entity = "World" within the raw data.
## Rig Count
The raw file named "Worldwide Rig Count Jan 2007_Mar 2024" was downloaded from [this website](https://rigcount.bakerhughes.com/intl-rig-count). Within the raw file, take only the "Avg." values for Total World.
## Dollar Index
The raw file named "US Dollar Index Historical Data" was downloaded from [Investing.com](https://www.investing.com/indices/usdollar-historical-data). Filter to Dec 1 of each year, and pick the Price value.
## legislation
See README_intial, only that this time the counting is done on a yearly basis.
## Population
The raw file named "API_SP.POP.TOTL_DS2_en_csv_v2_84031" was downloaded from [The World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL?end=2022&start=1980). Filter to Country = "World" in the downloaded file.

