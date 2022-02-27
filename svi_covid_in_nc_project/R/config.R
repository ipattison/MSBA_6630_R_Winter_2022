print("config.R: top")

HOME <- '.'
DATA_PATH <- paste(HOME, "data", sep = '/')
DOCS_PATH <- paste(HOME, "docs", sep = '/')
FIGS_PATH <- paste(HOME, "figs", sep = '/')
OUTPUT_PATH <- paste(HOME, "output", sep = '/')
SCRIPTS_PATH <- paste(HOME, "R", sep = "/")

# Global Variables
STATE = "North Carolina"
SVI_YEAR <- "2018"
SVI_DOC_FILENAME <- "SVI2018Documentation_01192022_1.pdf"

# URLS
SVI_DOCS_URL <- "https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/pdf"
SVI_URL <- 
  paste("https://svi.cdc.gov/Documents/Data/", SVI_YEAR, 
        "_SVI_Data", sep = '')
COVID_URL <- "https://data.cdc.gov/resource/n8mc-b4w4.json?state_fips_code=37"

# Project directory paths
HOME <- getwd()
COUNTIES_FIPS_DATA_PATH <- paste(DATA_PATH, "counties_fips", sep = '/')

# Filenames
COUNTIES_FIPS_RDATA_FILENAME <- "counties_fips.RData"

# Extract County_FIPS values from SVI CSV file
COUNTIES_FIPS_RDATA_DST <- paste(COUNTIES_FIPS_DATA_PATH, 
                                  COUNTIES_FIPS_RDATA_FILENAME, sep = "/")

# Store in a variable the fact that the config.R file has been loaded
PROJECT_CONFIG_LOADED <- T
