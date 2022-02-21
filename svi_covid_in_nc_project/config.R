# Global Variables
STATE = "North Carolina"

# Project directory paths
HOME <- getwd()
DATA_PATH <- paste(HOME, "data", sep = '/')
DOCS_PATH <- paste(HOME, "docs", sep = '/')
FIGS_PATH <- paste(HOME, "figs", sep = '/')
OUTPUT <- paste(HOME, "output", sep = '/')
SCRIPTS <- paste(HOME, "R", sep = "/")

# CDC Social Vulnerability Index (SVI) config - documentation
SVI_DOCS <- paste(DOCS_PATH, "svi", sep = '/')
SVI_DOCS_URL <- "https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/pdf"
SVI_DOC_FILE <- "SVI2018Documentation_01192022_1.pdf"

# CDC Social Vulnerability Index (SVI) config - shapefiles
SVI_DATA <- paste(DATA_PATH, "svi", sep = '/')
SVI_SHAPES <- paste(SVI_DATA, "shapefiles", sep = '/')
SVI_YEAR <- "2018"
SVI_BASEURL <- 
  paste("https://svi.cdc.gov/Documents/Data/", SVI_YEAR, 
        "_SVI_Data", sep = '')
SVI_STATE_COUNTY <- paste(gsub("[[:space:]]", "", STATE), "_COUNTY", sep = '')

# Extract County_FIPS values from SVI CSV file
COUNTY_FIPS_DATA <- paste(DATA_PATH, "county_fips", sep = '/')
