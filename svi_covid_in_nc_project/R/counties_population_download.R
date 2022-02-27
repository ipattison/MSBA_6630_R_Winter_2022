Packages <- c("data.table")
pacman::p_load(char = Packages)
rm(Packages)

pop_url <- "https://demography.osbm.nc.gov/explore/dataset/historic-census/download/?format=csv&disjunctive.areatype=true&disjunctive.areaname=true&q=year:%5B2020-01-01+TO+2022-02-01%5D&timezone=UTC&lang=en&use_labels_for_header=true&csv_separator=%3B"
counties_population_home <- "./data/counties_population"
counties_population_filename <- "counties_population.RData"
COUNTIES_POPULATION_RDATA <- paste(counties_population_home, 
                                counties_population_filename, sep = "/")

population <- fread(pop_url, sep = ";", 
                    select = c('AreaName' = 'character','Population' = 'numeric'), 
                    col.names = c('COUNTY', 'POPULATION'))
population[,"COUNTY"] <- toupper(population[,COUNTY])

save(population, file = COUNTIES_POPULATION_RDATA)

rm(list = c('pop_url',
            'counties_population_filename',
            'counties_population_home',
            'population'))