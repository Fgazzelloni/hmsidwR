# source: IHME GBD Results
library(tidyverse)
library(sf)
inf_dis_80_21_1 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-1.csv")
# names(inf_dis_80_21_1)
# inf_dis_80_21_1%>%count(measure_name)
a <- inf_dis_80_21_1 %>%
  select(
    year,
    measure_name, location_name,
    location_id, cause_name,
    val
  )
inf_dis_80_21_2 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-2.csv")
# names(inf_dis_80_21_2)
# inf_dis_80_21_2%>%count(measure_name)
b <- inf_dis_80_21_2 %>%
  select(
    year,
    measure_name, location_name,
    location_id, cause_name,
    val
  )
inf_dis_80_21_3 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-3.csv")
# names(inf_dis_80_21_3)
# inf_dis_80_21_3%>%count(measure_name)
c <- inf_dis_80_21_3 %>%
  select(
    year,
    measure_name, location_name,
    location_id, cause_name,
    val
  )
dat <- rbind(a, b, c) %>%
  mutate(measure_name = case_when(
    measure_name == "DALYs (Disability-Adjusted Life Years)" ~ "DALYs",
    measure_name == "YLLs (Years of Life Lost)" ~ "YLLs",
    measure_name == "YLDs (Years Lived with Disability)" ~ "YLDs",
    .default = measure_name
  )) %>%
  pivot_wider(names_from = measure_name, values_from = val)

# my_regions <- dat%>%count(location_name)%>%select(-n)%>%unlist()%>%unique()
# regions <- map_data("world")%>%count(region)%>%select(-n)%>%unlist()%>%unique()
# diff<- setdiff(my_regions,regions)

# my_regions2 <- countrycode::countryname(my_regions)
# diff2<- setdiff(my_regions2,regions)

idDALY_map_data <- dat %>%
  group_by(location_name) %>%
  summarise(DALYs = mean(DALYs, na.rm = T)) %>%
  ungroup() %>%
  mutate(location_name = countrycode::countryname(location_name)) %>%
  inner_join(
    map_data("world") %>%
      mutate(region = countrycode::countryname(region)) %>%
      filter(!region == "Antarctica"),
    by = c("location_name" = "region")
  ) %>%
  select(-subregion, -order) %>%
  st_as_sf(
    coords = c("long", "lat"),
    crs = 4326,
    agr = "constant"
  ) %>%
  st_cast("POINT") %>%
  group_by(group, location_name, DALYs) %>%
  summarise(
    geometry = st_combine(geometry),
    do_union = F
  ) %>%
  st_cast("POLYGON")

# write a sf object to a shapefile
# sf::st_write(
#   idDALY_map_data,
#   "inst/extdata/ihme/infectious_diseases/idDALY_map_data.shp"
# )

world_map <- map_data("world") %>%
  filter(!region == "Antarctica") %>%
  st_as_sf(
    coords = c("long", "lat"),
    crs = 4326,
    agr = "constant"
  ) %>%
  st_cast("POINT") %>%
  group_by(group) %>%
  summarise(
    geometry = st_combine(geometry),
    do_union = F
  ) %>%
  st_cast("POLYGON")


world_map %>%
  ggplot() +
  geom_sf() +
  geom_sf(
    data = idDALY_map_data,
    aes(fill = DALYs)
  ) +
  labs(
    title = "Infectious Diseases World Map",
    caption = "Average DALYs per country 1990-2021\nDataSource: IHME Data & ggplot2::map_data"
  ) +
  scale_fill_viridis_c() +
  ggthemes::theme_map() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.caption = element_text(hjust = 0.5)
  )


usethis::use_data(idDALY_map_data, overwrite = TRUE)
devtools::document()
