# Rabies vs. all causes Rates of Deaths and DALYs from 1980 to 2021 in the Global Region and Asia.

library(tidyverse, quietly = T)
rabies_raw <- unzip("inst/extdata/ihme/rabies_raw.zip",
              exdir = tempdir())

rabies_raw <- read_csv(rabies_raw[1])

rabies <- rabies_raw %>%
  select(-sex, -metric, -age) %>%
  mutate(measure = gsub("^\\s*(\\S+).*", "\\1", measure),
         measure = trimws(measure),
         val = round(val, 3),
         upper = round(upper),
         lower = round(lower, 3))


usethis::use_data(rabies,
                  overwrite = TRUE,
                  compress = "xz")
devtools::document()
