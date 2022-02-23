source("config.R")

# Load necessary libraries
Packages <- c("RSocrata")
pacman::p_load(char = Packages)

covid_data <- read.socrata(COVID_URL)
save(covid_data, file = COVID_DATA_FILE)

