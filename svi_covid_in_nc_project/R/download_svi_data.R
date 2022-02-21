source("config.R")

# SVI Documentation
if (!file.exists(SVI_DOCS)) {
  dir.create(SVI_DOCS)
}

download.file(
  paste(SVI_DOCS_URL, SVI_DOC_FILE, sep = '/'),
  paste(SVI_DOCS, SVI_DOC_FILE, sep = '/')
)

# CDC SVI CSV Data File for North Carolina Counties

filename_svi_nc_county_csv <- paste(SVI_STATE_COUNTY, ".csv", sep = '')
url_svi_nc_county_csv <- 
  paste(SVI_BASEURL, "CSV/States_Counties", 
        filename_svi_nc_county_csv, sep = '/')
download.file(url_svi_nc_county_csv, 
              paste(SVI_DATA, filename_svi_nc_county_csv, sep = '/'))

# CDC SVI Shapefiles for North Carolina Counties

filename_svi_nc_county_shapefiles <- paste(SVI_STATE_COUNTY, ".zip", sep = '')
url_svi_nc_county_shapefiles <- 
  paste(SVI_BASEURL, "States_Counties", 
        filename_svi_nc_county_shapefiles, sep = '/')
dest_svi_nc_county_shapefiles <- 
  paste(SVI_SHAPES, filename_svi_nc_county_shapefiles, sep = '/')
download.file(url_svi_nc_county_shapefiles, dest_svi_nc_county_shapefiles)
unzip(dest_svi_nc_county_shapefiles, exdir = SVI_SHAPES)
