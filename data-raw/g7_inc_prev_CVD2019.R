# G7 countries Health Metrics - Incidence and Prevalence for CVD 2019
# percent values

url <-"https://dl.healthdata.org:443/gbd-api-2019-public/2de0ac3d09765f477067d652e65d9b03_files/IHME-GBD_2019_DATA-2de0ac3d-1.zip"
dat <- hmsidwR::getunz(url)
library(tidyverse,quietly = T)
g7_inc_prev_CVD2019 <- dat %>%
  as.data.frame()%>%
  select(-metric,-year)%>%
  mutate(age=gsub(" .*","",age),
         age=gsub("1-4","01-04",age),
         age=gsub("5-9","05-09",age),
         age=gsub("<1","-01",age),
         sex=tolower(sex),
         location=case_when(location=="United Kingdom"~"UK",
                   location=="United States"~"US",
                   .default=location))


usethis::use_data(g7_inc_prev_CVD2019, overwrite = TRUE)
devtools::document()
