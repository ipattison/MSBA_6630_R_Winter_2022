# Load necessary libraries
Packages <- c("tidyverse")
pacman::p_load(char = Packages)

source("./R/config_covid.R")
source("./R/config_svi.R")

load(COVID_RDATA)
load(SVI_RDATA)
load('./data/counties_population/counties_population.RData')

COVID_SVI_PCT_FILENAME <- "covid_svi_pct.RData"
COVID_SVT_PCT_RDATA <- paste(DATA_PATH, COVID_SVI_PCT_FILENAME, sep = "/")

svi_pct <- svi_data %>% select("COUNTY",starts_with("EP_"))

covid_county_cases <- covid_data %>% 
  group_by(COUNTY) %>% 
  summarize(CASE_COUNT = n())

covid_county_pct <- na.omit(
  merge(x=covid_county_cases, y=population, by = "COUNTY", all.x = TRUE) %>% 
    mutate(P_COVID = round(CASE_COUNT / POPULATION, 3) * 100) %>% 
    select(COUNTY, P_COVID)) 

covid_svi_pct <- merge(x=covid_county_pct, y=svi_pct, by = "COUNTY", all.x = T)
covid_svi_pct <- column_to_rownames(covid_svi_pct, var = "COUNTY")

save(covid_svi_pct, file = COVID_SVT_PCT_RDATA)
rm(list=c("covid_data", 
          "covid_svi_pct", 
          "population", 
          "svi_pct", 
          "covid_county_cases", 
          "covid_county_pct"))

