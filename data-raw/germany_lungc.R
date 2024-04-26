## Health Metrics - Germany lung cancer dataset
library(tidyverse,quietly = T)

germany_lungc <- hmsidwR::deaths2019%>%
  filter(location =="Germany",
         str_detect(cause,"lung"))%>%
  select(-location,-cause)


usethis::use_data(germany_lungc, overwrite = TRUE)
devtools::document()


