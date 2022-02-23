# A script to extract county names and fips from the CDC SVI data for NC

# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}

if (!file.exists(COUNTIES_FIPS_RDATA_DST)) {
  
  if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
  if (!dir.exists(SVI_DATA_PATH)) dir.create(SVI_DATA_PATH)
  if (!dir.exists(COUNTIES_FIPS_DATA_PATH)) dir.create(COUNTIES_FIPS_DATA_PATH)
  
  # Load necessary libraries
  Packages <- c("tidyverse")
  pacman::p_load(char = Packages)
  
  # Read in the fips and county names from the data file
  if (file.exists(SVI_RDATA_DST)) {
    load(SVI_RDATA_DST) 
  } else {
    stop("Error loading SVI RData file: file does not exist!")
  }  
  
  
  counties_fips <- svi_data %>% 
    select(FIPS, COUNTY) %>% 
    unique() # I only want one instance of each fips code and county
  
  # make county names uppercase
  counties_fips$COUNTY <- toupper(counties_fips$COUNTY)
  
  # order the dataframe by fips code in ascending order
  counties_fips <- counties_fips[order(counties_fips$FIPS), ]
  
  # save the dataframe as a RData file in the data directory
  save(counties_fips, file = COUNTIES_FIPS_RDATA_DST)
  
}

if (exists('counties_fips')) rm(counties_fips)
if (exists('svi_data')) rm(svi_data)
