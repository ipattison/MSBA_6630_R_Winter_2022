this_script <- "covid_download_data.R"
print(paste(this_script, ": top"))

if (!exists('COVID_CONFIG_LOADED')) {
  print(paste(this_script, ": loading config_covid.R"))
  if (file.exists("./R/config_covid.R")) {
    print(paste(this_script, ": file config_covid.R found"))
    source("./R/config_covid.R")
    print(paste(this_script, ": config_covid.R loaded"))
  } else {
    stop(paste(this_script, ": Error: missing config_covid.R file"))
  }
} else {
  print(paste(this_script, ": config_covid.R already loaded!"))
}

reqs <- c('COVID_DATA_PATH', 'COVID_URL')
for (req in reqs) {
  if (!exists(req)) {
    stop(paste(this_script, ": Error: value", req, "is not set!"))
  }
}

# Load necessary libraries
Packages <- c("RSocrata")
pacman::p_load(char = Packages)

covid_raw_filename <- "raw_nc_covid_data.RData"
covid_rdata_filename <- "nc_covid_data.RData"
covid_raw_dst <- paste(COVID_DATA_PATH, covid_raw_filename, sep = '/')
covid_rdata_dst <- paste(COVID_DATA_PATH, covid_rdata_filename, sep = '/')

if (!dir.exists(COVID_DATA_PATH)) dir.create(COVID_DATA_PATH)

if (!file.exists(covid_raw_dst)) {
  covid_data <- subset(read.socrata(COVID_URL))
  save(covid_data, file = covid_raw_dst)
  rm(covid_data)
}

COVID_RAW_RDATA <- covid_raw_dst

print(paste(this_script, ": bottom"))

# Remove the dataframe to free up memory
rm(list = c('Packages',
            'req', 'reqs',
            'covid_rdata_dst',
            'covid_raw_dst',
            'covid_rdata_filename',
            'covid_raw_filename',
            'this_script'))