# Spatial Data DALYs for Country Comparisons 2021

library(tidyverse)
compare_dalys_map <- read_csv("inst/extdata/ihme/countries_compare_dalys.csv")

world <- map_data("world")
world <- world[world$region != "Antarctica", ]

# find the difference between the two datasets
regions <- unique(world$region)
locations <- unique(compare_dalys_map$Location)

ihme_world <- world %>%
  mutate(region = case_when(
    region %in% c("Antigua", "Barbuda") ~ "Antigua and Barbuda",
    region == "Bolivia" ~ "Bolivia (Plurinational State of)",
    region == "Brunei" ~ "Brunei Darussalam",
    region == "Ivory Coast" ~ "Côte d'Ivoire",
    region == "Republic of Congo" ~ "Congo",
    region == "Cape Verde" ~ "Cabo Verde",
    region == "Czech Republic" ~ "Czechia",
    region == "Micronesia" ~ "Micronesia (Federated States of)",
    region == "UK" ~ "United Kingdom",
    region == "Iran" ~ "Iran (Islamic Republic of)",
    region %in% c("Saint Kitts", "Nevis") ~ "Saint Kitts and Nevis",
    region == "South Korea" ~ "Republic of Korea",
    region == "Laos" ~ "Lao People's Democratic Republic",
    region == "Moldova" ~ "Republic of Moldova",
    region == "North Korea" ~ "Democratic People's Republic of Korea",
    region == "Russia" ~ "Russian Federation",
    region == "Syria" ~ "Syrian Arab Republic",
    region %in% c("Trinidad", "Tobago") ~ "Trinidad and Tobago",
    region == "Turkey" ~ "Türkiye",
    region == "Taiwan" ~ "Taiwan (Province of China)",
    region == "Tanzania" ~ "United Republic of Tanzania",
    region == "USA" ~ "United States of America",
    region %in% c("Saint Vincent", "Grenadines") ~ "Saint Vincent and the Grenadines",
    region == "Venezuela" ~ "Venezuela (Bolivarian Republic of)",
    region == "Virgin Islands" ~ "United States Virgin Islands",
    region == "Vietnam" ~ "Viet Nam",
    TRUE ~ region  # Default case to keep original region if no match
  ))

ihme_region <- unique(ihme_world$region)
# setdiff(locations, ihme_region)

ihme_world <- ihme_world %>%
  rename(location = region) %>%
  select(-subregion, -order)

dalys <- compare_dalys_map%>%
  janitor::clean_names()%>%
  select(-age,-measure,-sex,-year,-cause_of_death_or_injury)

spatialdalys2021 <- dalys %>%
  left_join(ihme_world, by = "location")

usethis::use_data(spatialdalys2021,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()



