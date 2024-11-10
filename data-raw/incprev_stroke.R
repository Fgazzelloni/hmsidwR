# Global Region Health Metrics Data - Incidence and Prevalence for Stroke 2019 and 2021
# Numbers - 5-year age groups from <1 to 85+ and both
library(tidyverse, quietly = T)

incprev_stroke_raw <- unzip("inst/extdata/ihme/incprev_stroke_raw.zip",
             exdir = tempdir(),)

incprev_stroke_raw <- read_csv(incprev_stroke_raw[1])

incprev_stroke <- incprev_stroke_raw %>%
  as.data.frame() %>%
  select(-metric, -location, -cause) %>%
  mutate(
    age = gsub(" .*", "", age),
    age = gsub("2-4", "01-04", age),
    age = gsub("5-9", "05-09", age),
    # age = gsub("<1", "-01", age),
    sex = tolower(sex))

# Define the correct order of age groups
age_levels <- c("<1", "01-04", "05-09", "10-14",
                "15-19", "20-24", "25-29", "30-34",
                "35-39", "40-44", "45-49", "50-54",
                "55-59", "60-64","65-69", "70-74",
                "75-79", "80-84", "85+")

# Convert the Age column to a factor with the specified order
incprev_stroke$age <- factor(incprev_stroke$age,
                                  levels = age_levels,
                                  ordered = TRUE)
incprev_stroke <- incprev_stroke[order(incprev_stroke$age), ]


usethis::use_data(incprev_stroke,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
