# G7 countries Health Metrics - Age Standardized - 2010, 2019, and 2021 - All Causes and Respiratory Infections and Tuberculosis
library(tidyverse, quietly = T)
g7_hmetrics_raw <- unzip("inst/extdata/ihme/g7_hmetrics_raw.zip",
                         exdir = tempdir())

g7_hmetrics_raw <- read_csv(g7_hmetrics_raw[1])

g7_hmetrics <- g7_hmetrics_raw %>%
  as.data.frame() %>%
  mutate(
    location = case_when(location == "United Kingdom" ~ "UK",
      location == "United States of America" ~ "US",
      .default = location
    ),
    measure = case_when(measure == "DALYs (Disability-Adjusted Life Years)" ~ "DALYs",
      measure == "YLDs (Years Lived with Disability)" ~ "YLDs",
      measure == "YLLs (Years of Life Lost)" ~ "YLLs",
      .default = measure
    )
  ) %>%
  select(-age)

g7_hmetrics <- g7_hmetrics %>%
  mutate(sex = tolower(sex))


usethis::use_data(g7_hmetrics,
                  compress = "xz",
                  overwrite = T)
devtools::document()
