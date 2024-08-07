# Health Metrics - Number of Deaths Due to 9 Causes in 6 Locations for the Years 2011 and 2021.

library(tidyverse, quietly = T)
library(countrycode)
# this link expired
url <- "https://dl.healthdata.org:443/gbd-api-2021-public/72fe359e16ef4032975df1c33515f8bd_files/IHME-GBD_2021_DATA-72fe359e-1.zip"

dat <- hmsidwR::getunz(url)
# dat[[1]] |> View()

data <- dat[[1]]

deaths <- data %>%
  select(-upper, -lower, -metric, -measure) %>%
  rename(dx = val) %>%
  mutate(age = gsub(" .*", "", age),
         age = gsub("5-9", "05-09", age),
    sex = tolower(sex),
    location = case_when(location == "United Kingdom" ~ "UK",
      location == "United States of America" ~ "US",
      .default = location))

# Define the correct order of age groups
age_levels <- c("<5", "05-09", "10-14", "15-19", "20-24", "25-29", "30-34",
                "35-39", "40-44", "45-49", "50-54", "55-59", "60-64",
                "65-69", "70-74", "75-79", "80-84", "85+")

# Convert the Age column to a factor with the specified order
deaths$age <- factor(deaths$age, levels = age_levels, ordered = TRUE)
deaths <- deaths[order(deaths$age), ]

location <- deaths$location |> unique()
iso2 <- countrycode(location, 'country.name', 'iso2c')

deaths9 <- merge(data.frame(location, iso2),deaths)

usethis::use_data(deaths9, overwrite = TRUE)
devtools::document()
