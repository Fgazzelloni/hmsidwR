## code to prepare `GDBSDI_1990_2019` dataset goes here
library(readxl)
library(httr)

url <- "https://ghdx.healthdata.org/sites/default/files/record-attached-files/IHME_GBD_2019_SDI_1990_2019_Y2020M10D15.XLSX"
GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))
tf

df <- read_excel(tf, skip = 1)

sdi90_19 <- df |>
  tidyr::pivot_longer(cols = -1, names_to = "year") |>
  janitor::clean_names() |>
  dplyr::mutate(
    value = gsub("0·", "0.", value),
    value = as.double(value),
    year = lubridate::year(as.Date(year, "%Y"))
  )

# sdi_avg <- sdi90_19|>
#   group_by(location)|>
#   reframe(sdi_avg=round(mean(value),3))
#
# sdi_4c <- sdi90_19|>
#   filter(location%in%c("Global","Italy","France","Germany"))


usethis::use_data(sdi90_19, overwrite = TRUE)
