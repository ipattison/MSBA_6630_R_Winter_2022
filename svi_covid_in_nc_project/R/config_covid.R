print("config_covid.R: top")

# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  print("config_covid.R: loading config.R")
  if (file.exists("./R/config.R")) {
    print("config_covid.R: found config.R file")
    source("./R/config.R")
    print("config_covid.R: config.R loaded")
  } else {
    stop("config_covid.R: Error: missing config.R file")
  }
} else {
  print("config_covid.R: config.R already loaded")
}

reqs <- c('DATA_PATH')
for (req in reqs) {
  if (!exists(req)) {
    stop("config_covid.R: Error: value", req, "is not set!")
  }
}

COVID_DATA_PATH <- paste(DATA_PATH, "covid", sep = '/')
COVID_RDATA <- paste(COVID_DATA_PATH, "nc_covid_data.RData", sep = "/")

get_county_case_cnt <- function(data, new_col = CASE_COUNT) {
  names(data)
  data %>% group_by(COUNTY) %>% summarize(new_col = n())
}

COVID_CONFIG_LOADED <- T
rm(list=c('reqs'))