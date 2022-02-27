# Global variables
if (!exists('SVI_CONFIG_LOADED')) {
  if (file.exists("config_svi.R")) {
    source("config_svi.R")
  } else {
    stop("Error: missing config_svi.R file")
  }
}

svi_doc_src <- paste(SVI_DOCS_URL, SVI_DOC_FILENAME, sep = '/')
svi_doc_dst <- paste(SVI_DOCS_PATH, SVI_DOC_FILENAME, sep = '/')

# SVI Documentation
if (!file.exists(svi_doc_dst)) 
  download.file(svi_doc_src, svi_doc_dst)

SVI_DOC <- svi_doc_dst

rm(list=c('svi_doc_dst', 
          'svi_doc_src'))