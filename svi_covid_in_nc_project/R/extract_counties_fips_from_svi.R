# A script to extract county names and fips from the CDC SVI data for NC

# Load necessary libraries
Packages <- c("tidyverse")
pacman::p_load(char = Packages)

# Global variables
source("config.R")

# Local variables

# location of the CDC SVI data file containing the county names and fips
src_file <- paste(SVI_DATA, filename_svi_nc_county_csv, sep = "/")

# location of the RData file containing the extracted variables
dest_file <- paste(COUNTY_FIPS_DATA, "counties_fips.RData", sep = "/")

# main

# Read in the fips and county names from the data file
counties_fips <- read.csv(src_file) %>% 
  select(FIPS, COUNTY) %>% 
  unique() # I only want one instance of each fips code and county

# make county names uppercase
counties_fips$COUNTY <- toupper(counties_fips$COUNTY)

# order the dataframe by fips code in ascending order
counties_fips <- counties_fips[order(counties_fips$FIPS), ]

# save the dataframe as a RData file in the data directory
save(counties_fips, file = dest_file)
