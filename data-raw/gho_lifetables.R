## Global Health Observatory (GHO) - Global region lifetables 2000-2019
# Data is from the World Bank and the WHO
# source: https://www.who.int/data/gho/data/indicators
library(tidyverse, quietly = T)

gho_lifetables_raw <- readRDS("inst/extdata/who/gho_lifetables_raw.rds")

gho_lifetables <- gho_lifetables_raw %>%
  janitor::clean_names() %>%
  select(
    gho_display,
    year_display,
    agegroup_display,
    sex_display,
    display_value
  ) %>%
  rename_with(~ gsub("_display|display_", "", .x)) %>%
  rename(age = agegroup, indicator = gho) %>%
  mutate(
    age = gsub(" .*", "", age),
    age = gsub("1-4", "01-04", age),
    age = gsub("5-9", "05-09", age),
    # age = gsub("<1", "-01", age),
    indicator = gsub(" .*", "", indicator),
    sex = ifelse(sex == "Both sexes", "both", sex),
    sex = tolower(sex)
  )

# Define the correct order of age groups
age_levels <- c("<1", "01-04", "05-09", "10-14", "15-19", "20-24", "25-29", "30-34",
                "35-39", "40-44", "45-49", "50-54", "55-59", "60-64",
                "65-69", "70-74", "75-79", "80-84", "85+")

# Convert the Age column to a factor with the specified order
gho_lifetables$age <- factor(gho_lifetables$age, levels = age_levels, ordered = TRUE)
gho_lifetables <- gho_lifetables[order(gho_lifetables$age), ]

usethis::use_data(gho_lifetables,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
