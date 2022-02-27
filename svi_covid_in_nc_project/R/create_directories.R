this_script <- "create_directories.R"
print(paste(this_script, ": top"))
# Global variables
if (!exists('PROJECT_CONFIG_LOADED')) {
  print(paste(this_script, ": loading config.R"))
  if (file.exists("./R/config.R")) {
    print(paste(this_script, ": found config.R file"))
    source("./R/config.R")
    print(paste(this_script, ": config.R loaded"))
  } else {
    stop(paste(this_script, ": Error: missing config.R file"))
  }
} else {
  print(paste(this_script, ": config.R already loaded"))
}

reqs <- c('DATA_PATH', 'DOCS_PATH', 'FIGS_PATH', 'OUTPUT_PATH', 'SCRIPTS_PATH')
for (req in reqs) {
  if (!exists(req)) {
    stop(paste(this_script, ": Error: value", req, "is not set!"))
  }
}

if (!exists('PROJECT_DIRS_CREATED')) {
  
  for (path in c(DATA_PATH, DOCS_PATH, FIGS_PATH, OUTPUT_PATH, SCRIPTS_PATH))
  {
    print(paste("create_directories.R: looking for", path, "directory."))
    if (!dir.exists(path)) {
      print(paste("create_directories.R: directory", path, "not found. creating."))
      dir.create(path)
      print(paste("create_directories.R: directory", path, "created."))
    } else {
      print(paste("create_directories.R: directory", path, "already exists."))
    }
  }
  
  PROJECT_DIRS_CREATED <- T
} else {
  print("create_directories.R: created_directories.R has already run")
}
print("create_directories.R: bottom")
rm('this_script')