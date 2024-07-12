# G7 countries Health Metrics - Incidence and Prevalence for CVD 2019
# percent values
library(tidyverse, quietly = T)
# this link expired
url <- "https://dl.healthdata.org:443/gbd-api-2019-public/2de0ac3d09765f477067d652e65d9b03_files/IHME-GBD_2019_DATA-2de0ac3d-1.zip"
dat <- hmsidwR::getunz(url)

g7_inc_prev_CVD2019 <- dat %>%
  as.data.frame() %>%
  select(-metric, -year) %>%
  mutate(
    age = gsub(" .*", "", age),
    age = gsub("1-4", "01-04", age),
    age = gsub("5-9", "05-09", age),
    # age = gsub("<1", "-01", age),
    sex = tolower(sex),
    location = case_when(location == "United Kingdom" ~ "UK",
      location == "United States" ~ "US",
      .default = location
    )
  )

# Define the correct order of age groups
age_levels <- c("<1", "01-04", "05-09", "10-14", "15-19", "20-24", "25-29", "30-34",
                "35-39", "40-44", "45-49", "50-54", "55-59", "60-64",
                "65-69", "70-74", "75-79", "80-84", "85+")

# Convert the Age column to a factor with the specified order
g7_inc_prev_CVD2019$age <- factor(g7_inc_prev_CVD2019$age, levels = age_levels, ordered = TRUE)
g7_inc_prev_CVD2019 <- g7_inc_prev_CVD2019[order(g7_inc_prev_CVD2019$age), ]


usethis::use_data(g7_inc_prev_CVD2019, overwrite = TRUE)
devtools::document()
