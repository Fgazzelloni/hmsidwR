## Germany lung cancer dataset
library(tidyverse,quietly = T)
data <- read_csv("inst/extdata/ihme/IHME-GBD_2019_DATA-3a85d0d4-1.csv")

deaths_2029 <- data%>%
  select(!contains("_id"),-measure_name,-metric_name,-year)%>%
  rename_with(~gsub("_name", "", .x))

germany_lungc <- deaths_2029 %>%
  filter(location =="Germany",
         str_detect(cause,"lung")) %>%
  mutate(sex=tolower(sex))%>%
  mutate(age=sub(" years","",age))%>%
  select(-location,-cause)


usethis::use_data(germany_lungc, overwrite = TRUE)
devtools::document()


