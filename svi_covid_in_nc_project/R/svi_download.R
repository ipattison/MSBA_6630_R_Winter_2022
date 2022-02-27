this_script <- "svi_download.R"
# Global variables
print("svi_download.R: top")
if (!exists('SVI_CONFIG_LOADED')) {
  print("svi_download.R: loading config_svi.R")
  if (file.exists("./R/config_svi.R")) {
    print("svi_download.R: found config_svi.R file")
    source("./R/config_svi.R")
    print("svi_download.R: config_svi.R loaded")
  } else {
    stop("Error: missing config_svi.R file")
  }
} else {
  print("svi_download.R: config_svi.R already loaded")
}

reqs <- c('SCRIPTS_PATH')
for (req in reqs) {
  if (!exists(req)) {
    stop(paste(this_script, ": Error: value", req, "is not set!"))
  }
}

svi_scripts <- c('svi_download_data.R',
                 'svi_download_doc.R', 
                 'svi_download_shapefiles.R')

for (script in svi_scripts) {
  print(paste("svi_download.R: loading", script, "script"))
  source(paste(SCRIPTS_PATH, script, sep = '/'))  
}

rm('svi_scripts')
print("svi_download.R: bottom")
rm('this_script')