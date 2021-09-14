library(memoise)
library(dplyr)

# Downloads, and extracts the dataset for this assignment
# in an idem-potent manner, e.g. avoiding unnecessary downloading.
get_data <- memoise(function() {
  if (!file.exists("data")) {
    dir.create("data")
  }
  data_file_path <- file.path("data", "summarySCC_PM25.rds")
  if (!file.exists(data_file_path)) {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
    unzip(temp, exdir = "data")
    unlink(temp)
  }
  data <- as_tibble(readRDS(data_file_path))
  return(data)
})
