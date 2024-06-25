## Global Health Observatory (GHO) - Countries Life Expectancy and HALE 2000-2019

library(tidyverse, quietly = T)
data <- read_csv("https://apps.who.int/gho/athena/data/data-verbose.csv?target=GHO/WHOSIS_000001,WHOSIS_000015,WHOSIS_000002,WHOSIS_000007&profile=verbose&filter=COUNTRY:*&ead=")

gho_le_hale <- data %>%
  janitor::clean_names() %>%
  select(
    matches("_display|display_"),
    -publishstate_display
  ) %>%
  rename_with(~ gsub("_display|display_", "", .x)) %>%
  rename(indicator = gho) %>%
  mutate(sex = tolower(sex))

usethis::use_data(gho_le_hale, overwrite = TRUE)
devtools::document()
