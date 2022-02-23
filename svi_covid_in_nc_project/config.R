# Global Variables
STATE = "North Carolina"
STATE_COUNTY <- paste(gsub("[[:space:]]", "", STATE), "_COUNTY", sep = '')
SVI_YEAR <- "2018"

# Project directory paths
#HOME <- getwd()
HOME <- '.'
DATA_PATH <- paste(HOME, "data", sep = '/')
DOCS_PATH <- paste(HOME, "docs", sep = '/')
FIGS_PATH <- paste(HOME, "figs", sep = '/')
OUTPUT_PATH <- paste(HOME, "output", sep = '/')
SCRIPTS_PATH <- paste(HOME, "R", sep = "/")
SVI_DOCS_PATH <- paste(DOCS_PATH, "svi", sep = '/')
SVI_DATA_PATH <- paste(DATA_PATH, "svi", sep = '/')
SHAPES_PATH <- paste(SVI_DATA_PATH, "shapefiles", sep = '/')
COUNTIES_FIPS_DATA_PATH <- paste(DATA_PATH, "counties_fips", sep = '/')
COVID_DATA_PATH <- paste(DATA_PATH, "covid", sep = '/')

# Filenames
SVI_DOC_FILENAME <- "SVI2018Documentation_01192022_1.pdf"
SVI_CSV_FILENAME <- paste(STATE_COUNTY, "csv", sep = '.')
SVI_RDATA_FILENAME <- paste(STATE_COUNTY, ".RData", sep = '')
SHAPES_ZIP_FILENAME <- paste(STATE_COUNTY, ".zip", sep = '')
COUNTIES_FIPS_RDATA_FILENAME <- "counties_fips.RData"
COVID_RDATA_FILENAME <- "nc_covid_data.RData"

# URLS
SVI_DOCS_URL <- "https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/pdf"
SVI_URL <- 
  paste("https://svi.cdc.gov/Documents/Data/", SVI_YEAR, 
        "_SVI_Data", sep = '')
COVID_URL <- "https://data.cdc.gov/resource/n8mc-b4w4.json?state_fips_code=37"

# CDC Social Vulnerability Index (SVI) config - documentation
SVI_DOC_SRC <- paste(SVI_DOCS_URL, SVI_DOC_FILENAME, sep = '/')
SVI_DOC_DST <- paste(SVI_DOCS_PATH, SVI_DOC_FILENAME, sep = '/')

# CDC Social Vulnerability Index (SVI) config - shapefiles
SVI_CSV_SRC <- 
  paste(SVI_URL, "CSV/States_Counties", SVI_CSV_FILENAME, sep = '/')
SVI_RDATA_DST <- paste(SVI_DATA_PATH, SVI_RDATA_FILENAME, sep = '/')

# SVI Shapefiles
SHAPES_ZIP_SRC <- 
  paste(SVI_URL, "States_Counties", SHAPES_ZIP_FILENAME, sep = '/')
SHAPES_ZIP_DST <- 
  paste(SHAPES_PATH, SHAPES_ZIP_FILENAME, sep = '/')


# Extract County_FIPS values from SVI CSV file
COUNTIES_FIPS_RDATA_DST <- paste(COUNTIES_FIPS_DATA_PATH, 
                                  COUNTIES_FIPS_RDATA_FILENAME, sep = "/")

# CDC COVID-19 Data
COVID_RDATA_DST <- paste(COVID_DATA_PATH, COVID_RDATA_FILENAME, sep = '/')

# Store in a variable the fact that the config.R file has been loaded
PROJECT_CONFIG_LOADED <- T
