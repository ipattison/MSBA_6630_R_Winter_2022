# Global variables
if (!exists('SVI_CONFIG_LOADED')) {
  if (file.exists("config_svi.R")) {
    source("config_svi.R")
  } else {
    stop("Error: missing config_svi.R file")
  }
}

if (!exists('SVI_RDATA')) source('./R/svi_download_data.R')

load(SVI_RDATA)
svi_data[,"COUNTY"] <- toupper(svi_data[,COUNTY])
#svi_data <- rename(svi_data, COUNTY_FIPS_CODE = FIPS)