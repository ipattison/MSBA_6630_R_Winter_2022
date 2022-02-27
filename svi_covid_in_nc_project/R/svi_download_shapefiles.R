this_script <- "svi_download_shapefiles.R"

# Global variables
if (!exists('SVI_CONFIG_LOADED')) {
  if (file.exists("config_svi.R")) {
    source("config_svi.R")
  } else {
    stop("Error: missing config_svi.R file")
  }
}

reqs <- c('STATE_COUNTY', 'SVI_URL', 'SHAPES_PATH')
for (req in reqs) {
  if (!exists(req)) {
    stop(paste(this_script, "R: Error: Required value, ", 
               req, "is not set!"))
  }
}

shapes_zip_filename <- paste(STATE_COUNTY, ".zip", sep = '')
shapes_zip_src <- 
  paste(SVI_URL, "States_Counties", shapes_zip_filename, sep = '/')
shapes_zip_dst <- 
  paste(SHAPES_PATH, shapes_zip_filename, sep = '/')

# CDC SVI Shapefiles for North Carolina Counties
if (!file.exists(shapes_zip_dst)) 
  download.file(shapes_zip_src, shapes_zip_dst)
unzip(shapes_zip_dst, exdir = SHAPES_PATH)

SVI_SHAPEFILES <- SHAPES_PATH

rm(list = c('shapes_zip_dst', 
            'shapes_zip_src',
            'shapes_zip_filename'))
