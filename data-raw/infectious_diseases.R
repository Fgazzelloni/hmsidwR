# source: IHME GBD Results for infectious diseases deaths and YLLs 1980 to 2021
library(tidyverse)

dat <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21.csv")

infectious_diseases <- dat %>%
  filter(location_name %in% c("Lesotho",
                              "Eswatini",
                              "Malawi",
                              "Central African Republic",
                              "Zambia"))

usethis::use_data(infectious_diseases,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
