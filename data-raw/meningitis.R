# IHME data for Meningitis and include the number of deaths due to meningitis, as well as levels of two risk factors—particulate matter (PM2.5) and smoking—in the Central African Republic, Zambia, Eswatini, Lesotho, and Malawi from 1990 to 2021.
library(tidyverse, quietly = T)
meningitis_raw <- hmsidwR::infectious_diseases %>%
  filter(cause_name == "Meningitis")

sev <- readRDS("~/Documents/R/AAA_packages/hmsidwR_container/extra-files/data/ihme/meningitis/summary_exposure_values.rds")

meningitis <- meningitis_raw %>%
  arrange(year) %>%
  select(year, location = location_name,
         deaths = Deaths, dalys = DALYs) %>%
  full_join(sev, by = c("location", "year"))%>%
  filter(!is.na(dalys)) %>%
  rename(pm25 = `Particulate matter pollution`,
         smoking = Smoking)

usethis::use_data(meningitis,
                  compress = "xz",
                  overwrite = T)
devtools::document()
