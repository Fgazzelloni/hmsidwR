# Rabies vs. all causes

url <- "https://dl.healthdata.org/gbd-api-2019-public/fed4fc57f2ce4d5c181a9deac39da4e7_files/IHME-GBD_2019_DATA-fed4fc57-1.zip"
dat <- hmsidwR::getunz(url)
library(tidyverse,quietly = T)
rabies <- dat %>%
  as.data.frame()%>%
  select(-sex,-metric,-age)%>%
  mutate(measure=gsub("^\\s*(\\S+).*", "\\1",measure),
         measure=trimws(measure),
         val=round(val,3),
         upper=round(upper),
         lower=round(lower,3))


usethis::use_data(rabies, overwrite = TRUE)
