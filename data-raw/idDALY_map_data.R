# source: IHME GBD Results
library(tidyverse)
library(sf)

dat <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21.csv")

idDALY_map_data <- dat %>%
  group_by(location_name) %>%
  summarise(DALYs = mean(DALYs, na.rm = T)) %>%
  ungroup() %>%
  mutate(location_name = countrycode::countryname(location_name)) %>%
  inner_join(
    map_data("world") %>%
      mutate(region = countrycode::countryname(region)) %>%
      filter(!region == "Antarctica"),
             by = c("location_name" = "region")) %>%
  select(-subregion, -order) %>%
  st_as_sf(coords = c("long", "lat"),
           crs = 4326,
           agr = "constant") %>%
  st_cast("POINT") %>%
  group_by(group, location_name, DALYs) %>%
  summarise(geometry = st_combine(geometry),
            do_union = F) %>%
  st_cast("POLYGON")

usethis::use_data(idDALY_map_data,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
