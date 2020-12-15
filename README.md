# ETL-project
Extract, Transform, and Load data

GOAL: 
At the end of the project, you will submit a Final Report that describes the following:


Extract: your original data sources and how the data was formatted (CSV, JSON, pgAdmin 4, etc).


Transform: what data cleaning or transformation was required.


Load: the final database, tables/collections, and why this was chosen.

Methodology:

Happiness and Suicide Rates
The Data:
	
For this assignment I decided to look at the Global Happiness Index. I wanted to build a database that could be analyzed to look at suicide rates in countries compared to their happiness index rating and similar indexes. I extracted all of the data from Kraggle.com. The suicide rate data was provided in a CSV file that contained all the suicide data for differing age groups and genders. That data dated back to 1985. For this database I was not interested in anything dating back that far as the happiness index doesn’t date nearly as far back.
	
The happiness index data was divided by year starting in 2015 and going through 2019. The happiness index is a relatively new global index and therefore doesn’t date back as far as the suicide rate data. Similarly, the suicide rate data only went up to 2016, potentially due to lags in data submission. In total I acquired all the happiness index data for years 2015-2019 and the full dataset of suicide rate data.

Data Transformation:
	
Moving into data transformation, the main problem was getting data that had consistent years. The two datasets only overlap in the years 2015 and 2016. Those will be the two years that will be loaded into the database. I started by importing the happiness index data that was already divided by year. For the suicide data I had to create two new dataframes splitting the data by year, 2015 and 2016. Having split the suicide rate data into two new dataframes I could then merge the happiness data into the suicide data by country. This allowed for full country happiness index data to be linked with each country by year. After merging the four dataframes into two dataframes split by year, I concated the two new dataframes into one large dataframe. This final dataframe is what will be uploaded into MongoDB. Finally, I removed all the unnecessary or redundant columns that still existed.

Data Loading:
	
Originally while planning to load data, I thought that a relational database would be the best option. However, after attempting to load it into Postgress I quickly realized that there was redundant data meant to be the primary key for the datasets. Since each country has subsequent data for year, age range, and sex. At that point transforming the data into something that would fit a SQL database structure would lead to loss of data. After this realization, I switched to a non-relational database in order to maintain all of the data I thought was pertinent to any kind of analysis. Using MongoDB as my to host my database locally I was able to use python to load that data in. 
