# Health Metrics - Number of Deaths Due to 9 Causes in 2019

library(tidyverse,quietly = T)
data <- read_csv("inst/extdata/ihme/IHME-GBD_2019_DATA-3a85d0d4-1.csv")

deaths2019 <- data%>%
  select(!contains("_id"),
         -measure_name,
         -metric_name,
         -year)%>%
  rename_with(~gsub("_name", "", .x))%>%
  rename(dx=val)%>%
  mutate(age=gsub(" .*","",age),
         age=gsub("1-4","01-04",age),
         age=gsub("5-9","05-09",age),
         age=gsub("<1","-01",age),
         sex=tolower(sex),
         location=case_when(location=="United Kingdom"~"UK",
                            location=="United States of America"~"US",
                            .default=location))


usethis::use_data(deaths2019, overwrite = TRUE)
devtools::document()
