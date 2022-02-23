# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  if (file.exists("config.R")) {
    source("config.R")
  } else {
    stop("Error: missing config.R file")
  }
}

if (!dir.exists(DATA_PATH)) dir.create(DATA_PATH)
if (!dir.exists(SVI_DATA_PATH)) dir.create(SVI_DATA_PATH)
if (!dir.exists(SHAPES_PATH)) dir.create(SHAPES_PATH)
if (!dir.exists(SVI_DOCS_PATH)) dir.create(SVI_DOCS_PATH)

# CDC SVI CSV Data File for North Carolina Counties
if (!file.exists(SVI_RDATA_DST)) {
  svi_data <- read.csv(SVI_CSV_SRC)
  save(svi_data, file = SVI_RDATA_DST)
}

# SVI Documentation
if (!file.exists(SVI_DOC_DST)) download.file(SVI_DOC_SRC, SVI_DOC_DST)

# CDC SVI Shapefiles for North Carolina Counties
if (!file.exists(SHAPES_ZIP_DST)) download.file(SHAPES_ZIP_SRC, SHAPES_ZIP_DST)
unzip(SHAPES_ZIP_DST, exdir = SHAPES_PATH)

if (exists('svi_data')) rm(svi_data)