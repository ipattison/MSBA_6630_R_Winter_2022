# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}


if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
if (!dir.exists(COVID_DATA_PATH)) dir.create(COVID_DATA_PATH)

# Load necessary libraries
Packages <- c("RSocrata")
pacman::p_load(char = Packages)

covid_data <- read.socrata(COVID_URL)
save(covid_data, file = COVID_RDATA_DST)

rm(covid_data)