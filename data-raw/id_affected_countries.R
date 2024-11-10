# Source: IHME GBD Results for Infectious Diseases Deaths and YLLs from 1980 to 1999
library(tidyverse)

dat <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21.csv")

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
  reframe(DALYs = mean(DALYs, na.rm = T),
          YLLs = mean(YLLs, na.rm = T),
          YLDs = mean(YLDs, na.rm = T),
          Deaths = mean(Deaths, na.rm = T))

id_affected_countries[is.na(id_affected_countries)] <- 0

# id <- ggplot(id_affected_countries,
#              aes(x = year, group = location_name)) +
#   geom_line(aes(y = YLLs),
#             linewidth = 0.2,
#             color = "grey") +
#   geom_line(data = id_affected_countries %>%
#               filter(location_name %in% c("Lesotho",
#                                           "Eswatini",
#                                           "Malawi",
#                                           "Central African Republic",
#                                           "Zambia")),
#             aes(y = YLLs, color = location_name)) +
#   theme_minimal() +
#   theme(legend.position = "none") +
#   labs(title = "Countries with highest AVG YLLs",
#        subtitle = "due to infectious diseases from 1990 to 2021",
#        caption = "DataSource: IHME GBD Results for infectious diseases deaths and # YLLs 1980 to 1999",
#     x = "Year", y = "DALYs")
# # add a plotly version
# library(plotly)
# plotly::ggplotly(id)

# compress options: gzip, bzip2, xz
usethis::use_data(id_affected_countries,
                  compress = "xz",
                  overwrite = TRUE)

devtools::document()
