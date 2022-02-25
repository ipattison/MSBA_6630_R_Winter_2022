# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}

# Load necessary libraries
Packages <- c("lubridate","tidyverse")
pacman::p_load(char = Packages)

cols_factor <- c("case_month", "res_county", "county_fips_code", "age_group", 
          "sex", "race", "ethnicity", "process", "exposure_yn", 
          "current_status", "symptom_status", "hosp_yn", "icu_yn", 
          "death_yn", "underlying_conditions_yn")
cols_num <- c("case_positive_specimen", "case_onset_interval")

if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
if (!dir.exists(COVID_DATA_PATH)) dir.create(COVID_DATA_PATH)

# Load necessary libraries
Packages <- c("RSocrata")
pacman::p_load(char = Packages)

covid_data <- subset(read.socrata(COVID_URL))
covid_data <- covid_data[-c(2, 3)]
covid_data[cols_factor] <- lapply(covid_data[cols_factor], factor)
for (col in cols_num)
  covid_data[,col] <- as.numeric(covid_data[,col])
covid_data$case_month <- ym(covid_data$case_month)
covid_data$county <- toupper(covid_data$county)
covid_data %>% group_by(res_county) %>%  summarize(CASE_COUNT = n())
save(covid_data, file = COVID_RDATA_DST)

rm(covid_data)