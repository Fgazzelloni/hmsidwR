# source: IHME GBD Results for infectious diseases deaths and YLLs 1980 to 1999
library(tidyverse)
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


top_affected_countries <- dat %>%
  group_by(location_name) %>%
  summarise(DALYs = mean(DALYs, na.rm = T)) %>%
  arrange(desc(DALYs)) %>%
  filter(DALYs >= 200) %>%
  count(location_name) %>%
  select(-n) %>%
  unlist()

id_affected_countries <- dat %>%
  filter(location_name %in% top_affected_countries) %>% # count(cause_name)
  group_by(location_name, year) %>%
  reframe(
    DALYs = mean(DALYs, na.rm = T),
    YLLs = mean(YLLs, na.rm = T),
    YLDs = mean(YLDs, na.rm = T),
    Deaths = mean(Deaths, na.rm = T)
  )

id_affected_countries[is.na(id_affected_countries)] <- 0

id <- ggplot(
  id_affected_countries,
  aes(
    x = year,
    group = location_name
  )
) +
  geom_line(aes(y = YLLs),
    linewidth = 0.2,
    color = "grey"
  ) +
  geom_line(
    data = id_affected_countries %>%
      filter(location_name %in% c(
        "Lesotho",
        "Eswatini",
        "Malawi",
        "Central African Republic",
        "Zambia"
      )),
    aes(y = YLLs, color = location_name)
  ) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "Countries with highest AVG YLLs",
    subtitle = "due to infectious diseases from 1990 to 2021",
    caption = "DataSource: IHME GBD Results for infectious diseases deaths and YLLs 1980 to 1999",
    x = "Year", y = "DALYs"
  )
# add a plotly version
library(plotly)
plotly::ggplotly(id)


# compress options: gzip, bzip2, xz
usethis::use_data(id_affected_countries,
  # compress = "xz",
  overwrite = TRUE
)
devtools::document()
