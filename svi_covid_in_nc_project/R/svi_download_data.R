# Global variables
if (!exists('SVI_CONFIG_LOADED')) {
  if (file.exists("config_svi.R")) {
    source("config_svi.R")
  } else {
    stop("Error: missing config_svi.R file")
  }
}

# Load necessary libraries
Packages <- c("data.table", "tidyverse")
pacman::p_load(char = Packages)
rm(Packages)

svi_raw_filename <- paste(paste("raw", STATE_COUNTY, sep = "_"), "RData", sep=".")
svi_csv_filename <- paste(STATE_COUNTY, "csv", sep = '.')
# svi_rdata_filename <- paste(STATE_COUNTY, ".RData", sep = '')
# svi_rdata_dst <- paste(SVI_DATA_PATH, svi_rdata_filename, sep = '/')


svi_csv_src <- 
  paste(SVI_URL, "CSV/States_Counties", svi_csv_filename, sep = '/')

svi_raw_dst <- paste(SVI_DATA_PATH, svi_raw_filename, sep = '/')

# CDC SVI CSV Data File for North Carolina Counties
if (!file.exists(svi_raw_dst)) {
  svi_data <- fread(svi_csv_src, drop = c('ST', 'STATE','ST_ABBR','LOCATION'))
  save(svi_data, file = svi_raw_dst)
} else {
  load(svi_raw_dst)
}

svi_data[,"COUNTY"] <- toupper(svi_data[,COUNTY])
svi_data <- rename(svi_data, COUNTY_FIPS_CODE = FIPS)

save(svi_data, file = SVI_RDATA)
rm(list = c('svi_data', 
            'svi_raw_dst',
            'svi_csv_src',
            'svi_csv_filename',
            'svi_raw_filename'))

