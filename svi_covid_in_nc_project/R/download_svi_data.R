# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}

# Load necessary libraries
Packages <- c("data.table", "tidyverse")
pacman::p_load(char = Packages)

if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
if (!dir.exists(SVI_DATA_PATH)) dir.create(SVI_DATA_PATH)
if (!dir.exists(SHAPES_PATH)) dir.create(SHAPES_PATH)
if (!dir.exists(SVI_DOCS_PATH)) dir.create(SVI_DOCS_PATH)

# CDC SVI CSV Data File for North Carolina Counties
if (!file.exists(SVI_RAW_DST)) {
  svi_data <- fread(SVI_CSV_SRC, drop = c('ST', 'STATE','ST_ABBR','LOCATION'))
  save(svi_data, file = SVI_RAW_DST)
} else {
  load(SVI_RAW_DST)
}

#names(svi_raw_data)

svi_data[,"COUNTY"] <- toupper(svi_data[,COUNTY])
svi_data <- rename(svi_data, COUNTY_FIPS_CODE = FIPS)

save(svi_data, file = SVI_RDATA_DST)
rm(svi_data)

# SVI Documentation
if (!file.exists(SVI_DOC_DST)) download.file(SVI_DOC_SRC, SVI_DOC_DST)

# CDC SVI Shapefiles for North Carolina Counties
if (!file.exists(SHAPES_ZIP_DST)) download.file(SHAPES_ZIP_SRC, SHAPES_ZIP_DST)
unzip(SHAPES_ZIP_DST, exdir = SHAPES_PATH)
