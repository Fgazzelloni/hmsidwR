## Global Health Observatory (GHO) - Countries Life Expectancy and HALE 2000-2019

library(tidyverse, quietly = T)

gho_le_hale_raw <- readRDS("inst/extdata/who/gho_le_hale_raw.rds")

gho_le_hale <- gho_le_hale_raw %>%
  janitor::clean_names() %>%
  select(
    matches("_display|display_"),
    -publishstate_display
  ) %>%
  rename_with(~ gsub("_display|display_", "", .x)) %>%
  rename(indicator = gho) %>%
  mutate(sex = tolower(sex))

usethis::use_data(gho_le_hale,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
