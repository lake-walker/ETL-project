-- DATA ENGINEERING
-- Create titles table
CREATE TABLE age (
	age VARCHAR NOT NULL,
	age_id VARCHAR PRIMARY KEY NOT NULL);

-- Create generation table
CREATE TABLE generation (
	generation VARCHAR NOT NULL,
	generation_id VARCHAR PRIMARY KEY NOT NULL);


	
-- Create region table
CREATE TABLE region (
	region VARCHAR NOT NULL,
	region_id VARCHAR PRIMARY KEY NOT NULL);
	
-- Create years table
-- CREATE TABLE years (
-- 	years_id VARCHAR PRIMARY KEY NOT NULL,
-- 	years INT NOT NULL);
	
-- Create sex table
CREATE TABLE sex (
	sex VARCHAR NOT NULL,
	sex_id VARCHAR PRIMARY KEY NOT NULL);

-- Create happiness table
CREATE TABLE happiness (
	happiness_rank INT NOT NULL,
	happiness_score INT NOT NULL,
	standard_error INT NOT NULL,
	gdp_per_capita INT NOT NULL,
	fam INT NOT NULL,
	life_expectancy INT NOT NULL,
	freedom INT NOT NULL,
	govt_trust INT NOT NULL,
	generosity INT NOT NULL,
	dystopia_residual INT NOT NULL,
	years VARCHAR NOT NULL,
	lower_confidence INT NOT NULL,
	upper_confidence INT NOT NULL,
	country_id VARCHAR PRIMARY KEY NOT NULL,
	region_id VARCHAR NOT NULL,
	--FOREIGN KEY (country_id) REFERENCES country(country_id),
-- 	FOREIGN KEY (year_id) REFERENCES years(years_id),
	FOREIGN KEY (region_id) REFERENCES region(region_id)
	);

-- Create suicide table
CREATE TABLE suicide (
	years VARCHAR NOT NULL,
	suicides INT NOT NULL,
	population BIGINT NOT NULL,
	sui_per_100k DECIMAL NOT NULL,
	gdp_for_year BIGINT NOT NULL,
	gdp_per_capita INT NOT NULL,
	country_id VARCHAR PRIMARY KEY NOT NULL,
	sex_id VARCHAR NOT NULL,
	age_id VARCHAR NOT NULL,
	generation_id VARCHAR NOT NULL,
	--FOREIGN KEY (country_id) REFERENCES country(country_id),
-- 	FOREIGN KEY (year_id) REFERENCES years(years_id),
	FOREIGN KEY (age_id) REFERENCES age(age_id),
	FOREIGN KEY (sex_id) REFERENCES sex(sex_id),
	FOREIGN KEY (generation_id) REFERENCES generation(generation_id)
	);

-- Create country table
CREATE TABLE country (
	country VARCHAR NOT NULL,
	country_id VARCHAR NOT NULL,
	FOREIGN KEY (country_id) REFERENCES suicide(country_id),
	FOREIGN KEY (country_id) REFERENCES happiness(country_id));

-- Import data into data tables 
-- SELECT * FROM age

DROP TABLE age, country, generation, happiness, region, sex, suicide;
