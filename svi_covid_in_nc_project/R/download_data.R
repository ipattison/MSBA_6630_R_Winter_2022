dest_dirs <- c(docs = "docs", data = "data")

# CDC SVI
dest_svi_docs <- paste(dest_dirs["docs"], "svi", sep = '/')
dest_svi_data <- paste(dest_dirs["data"], "svi", sep = '/')

svi_year <- "2018"

baseurl_svi_data <- 
  paste("https://svi.cdc.gov/Documents/Data/", svi_year, 
        "_SVI_Data", sep = '')

svi_state_county <- "NorthCarolina_COUNTY"

# SVI Documentation
svi_doc_file <- "SVI2018Documentation_01192022_1.pdf"

url_svi_2018_doc <- 
  paste("https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/pdf", svi_doc_file, sep = '/')

dest_svi_2018_doc <- paste(dest_svi_docs, svi_doc_file, sep = "/")

download.file(url_svi_2018_doc, dest_svi_2018_doc)

# CDC SVI CSV Data File for North Carolina Counties

filename_svi_nc_county_csv <- paste(svi_state_county, ".csv", sep = '')

url_svi_nc_county_csv <- 
  paste(baseurl_svi_data, "CSV", "States_Counties", filename_svi_nc_county_csv, 
        sep = '/')
dest_svi_nc_county_csv <- paste(dest_svi_data, filename_svi_nc_county_csv, sep = '/')

download.file(url_svi_nc_county_csv, dest_svi_nc_county_csv)

# CDC SVI Shapefiles for North Carolina Counties

filename_svi_nc_county_shapefiles <- paste(svi_state_county, ".zip", sep = '')

url_svi_nc_county_shapefiles <- 
  paste(baseurl_svi_data, "States_Counties", 
        filename_svi_nc_county_shapefiles, sep = '/')

dest_svi_nc_county_shapefiles <- 
  paste(dest_svi_data, filename_svi_nc_county_shapefiles, sep = '/')

download.file(url_svi_nc_county_shapefiles, dest_svi_nc_county_shapefiles)

unzip(dest_svi_nc_county_shapefiles, exdir = dest_svi_data)
