# G7 countries Health Metrics - Age Standardized - 2010 and 2019

url <- "https://dl.healthdata.org/gbd-api-2019-public/4688ee725666241b02a21a52dffce9dc_files/IHME-GBD_2019_DATA-4688ee72-1.zip"
dat <- hmsidwR::getunz(url)
library(tidyverse,quietly = T)
g7_hmetrics <- dat %>%
    as.data.frame()%>%
    mutate(location=case_when(location=="United Kingdom of Great Britain and Northern Ireland" ~ "UK",
                              location=="United States of America" ~ "US",
                              .default = location),
           measure=case_when(measure=="DALYs (Disability-Adjusted Life Years)" ~ "DALYs",
                             measure=="YLDs (Years Lived with Disability)" ~ "YLDs",
                             measure=="YLLs (Years of Life Lost)" ~ "YLLs",
                             .default = measure)) %>%
    select(-age)

usethis::use_data(g7_hmetrics, overwrite = TRUE)
