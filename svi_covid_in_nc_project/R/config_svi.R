this_script <- "config_svi.R"
print(paste(this_script, ": top"))

# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  print(paste(this_script, ": loading config.R"))
  if (file.exists("./R/config.R")) {
    print(paste(this_script, ": found config.R file"))
    source("./R/config.R")
    print(paste(this_script, ": config.R loaded"))
  } else {
    stop(paste(this_script, ": Error: missing config.R file"))
  }
  print(paste(this_script, ": config.R already loaded"))
}

reqs <- c('STATE', "DATA_PATH", "DOCS_PATH")
for (req in reqs) {
  if (!exists(req)) {
    stop(paste(this_script, ": Error: value", req, "is not set!"))
  }
}

STATE_COUNTY <- paste(gsub("[[:space:]]", "", STATE), "_COUNTY", sep = '')

SVI_DATA_PATH <- paste(DATA_PATH, "svi", sep = '/')
SVI_DOCS_PATH <- paste(DOCS_PATH, "svi", sep = '/')
SHAPES_PATH <- paste(SVI_DATA_PATH, "shapefiles", sep = '/')
SVI_DATA_DICT <- paste(SVI_DATA_PATH, "data_dictionary", 
                       "CDC_SVI_2018_Data_Dictionary.RData", sep = "/")

svi_rdata_filename <- paste(STATE_COUNTY, ".RData", sep = '')
SVI_RDATA <- paste(SVI_DATA_PATH, svi_rdata_filename, sep = '/')


SVI_CONFIG_LOADED <- T
rm(list = c('svi_rdata_filename', 'this_script', 'reqs'))