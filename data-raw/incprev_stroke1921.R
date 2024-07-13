# Global Region Health Metrics Data - Incidence and Prevalence for Stroke 2019 and 2021
# Numbers - 5-year age groups from <1 to 85+ and both
library(tidyverse, quietly = T)
# this link expired
url <- "https://dl.healthdata.org:443/gbd-api-2021-public/9fccb9bbb734156f0976cde6a93396c8_files/IHME-GBD_2021_DATA-9fccb9bb-1.zip"
dat <- hmsidwR::getunz(url)

incprev_stroke1921 <- dat %>%
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
incprev_stroke1921$age <- factor(incprev_stroke1921$age,
                                  levels = age_levels,
                                  ordered = TRUE)
incprev_stroke1921 <- incprev_stroke1921[order(incprev_stroke1921$age), ]


usethis::use_data(incprev_stroke1921, overwrite = TRUE)
devtools::document()
