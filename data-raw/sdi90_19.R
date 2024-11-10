# SDI for 1990 and 2019 - Health Metrics Data

library(readxl)
library(httr)

url <- "https://ghdx.healthdata.org/sites/default/files/record-attached-files/IHME_GBD_2019_SDI_1990_2019_Y2020M10D15.XLSX"

# Create a temporary file path
temp_file <- tempfile(fileext = ".xlsx")

# Attempt to download the file
response <- GET(url, write_disk(temp_file, overwrite = TRUE))

df <- read_excel(temp_file, skip = 1)
# write.csv(df, "inst/extdata/ihme/sdi90_19_raw.csv", row.names = FALSE)

sdi90_19 <- df |>
  tidyr::pivot_longer(cols = -1, names_to = "year") |>
  janitor::clean_names() |>
  dplyr::mutate(
    value = gsub("0·", "0.", value),
    value = as.double(value),
    year = lubridate::year(as.Date(year, "%Y")))

usethis::use_data(sdi90_19,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
