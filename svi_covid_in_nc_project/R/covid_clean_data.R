this_script <- "covid_clean_data.R"
print(paste(this_script, ": top", sep = ""))

# Global variables
if (!exists('COVID_CONFIG_LOADED')) {
  if (file.exists("./R/config_covid.R")) {
    source("./R/config_covid.R")
  } else {
    stop(paste(this_script, ": Error: missing config_covid.R file"))
  }
}

# Load necessary libraries
Packages <- c("lubridate","tidyverse")
pacman::p_load(char = Packages)
rm('Packages')

cols_factor <- c("case_month", "res_county", "county_fips_code", "age_group", 
                 "sex", "race", "ethnicity", "process", "exposure_yn", 
                 "current_status", "symptom_status", "hosp_yn", "icu_yn", 
                 "death_yn", "underlying_conditions_yn")
cols_num <- c("case_positive_specimen", "case_onset_interval")

if (!exists('COVID_RAW_RDATA')) source('./R/covid_download_data.R')

load(COVID_RAW_RDATA)

# Remove columns related to state since we've only downloaded data for 
# North Carolina (2 = state name, 3 = state fips code)
covid_data <- covid_data[-c(2, 3)]

# Change variable types from character to correct types

# Change all the columns listed in cols_factor to factors using lapply() 
covid_data[cols_factor] <- lapply(covid_data[cols_factor], factor)

# Change all columns listed in cols_num to numeric using as.numeric()
for (col in cols_num)
  covid_data[,col] <- as.numeric(covid_data[,col])

# Change the case_month variable to type datetime
covid_data$case_month <- ym(covid_data$case_month)

# Take a look at the changes to the dataframe
str(covid_data)

# Change some column names

# To match the COUNTY column in the SVI data, change res_county to county
covid_data <- rename(covid_data, county = res_county)

# To match column case in SVI data, change case to upper for all column names
covid_data <- rename_with(covid_data, toupper)

#covid_data %>% group_by(res_county) %>%  summarize(CASE_COUNT = n())

# Save the modified dataframe to an RData file for later use
save(covid_data, file = COVID_RDATA)


rm(list = c("covid_data",
            "col",
            "cols_num",
            "cols_factor",
            "this_script"))