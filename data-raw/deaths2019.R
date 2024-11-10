# Health Metrics - Number of Deaths Due to 9 Causes in 2019

library(tidyverse, quietly = T)
data <- read_csv("inst/extdata/ihme/deaths2019_raw.csv")

deaths2019 <- data %>%
  select(
    !contains("_id"),
    -measure_name,
    -metric_name,
    -year
  ) %>%
  rename_with(~ gsub("_name", "", .x)) %>%
  rename(dx = val) %>%
  mutate(
    age = gsub(" .*", "", age),
    age = gsub("1-4", "01-04", age),
    age = gsub("5-9", "05-09", age),
    #age = gsub("<1", "-01", age),
    sex = tolower(sex),
    location = case_when(location == "United Kingdom" ~ "UK",
      location == "United States of America" ~ "US",
      .default = location
    )
  )

# Define the correct order of age groups
age_levels <- c("<1", "01-04", "05-09", "10-14", "15-19", "20-24", "25-29", "30-34",
                "35-39", "40-44", "45-49", "50-54", "55-59", "60-64",
                "65-69", "70-74", "75-79", "80-84", "85+")

# Convert the Age column to a factor with the specified order
deaths2019$age <- factor(deaths2019$age, levels = age_levels, ordered = TRUE)
deaths2019 <- deaths2019[order(deaths2019$age), ]

usethis::use_data(deaths2019,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
