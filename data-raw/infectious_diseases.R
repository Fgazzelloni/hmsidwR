# source: IHME GBD Results for infectious diseases deaths and YLLs 1980 to 2021
library(tidyverse)
inf_dis_80_21_1 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-1.csv")
# names(inf_dis_80_21_1)
# inf_dis_80_21_1%>%count(measure_name)
a <- inf_dis_80_21_1 %>%
  select(year,
         measure_name,location_name,
         location_id,cause_name,
         val)
inf_dis_80_21_2 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-2.csv")
# names(inf_dis_80_21_2)
# inf_dis_80_21_2%>%count(measure_name)
b <- inf_dis_80_21_2 %>%
  select(year,
         measure_name,location_name,
         location_id,cause_name,
         val)
inf_dis_80_21_3 <- read_csv("inst/extdata/ihme/infectious_diseases/IHME-GBD_2021_DATA-9cf0c87f-3.csv")
# names(inf_dis_80_21_3)
# inf_dis_80_21_3%>%count(measure_name)
c <- inf_dis_80_21_3 %>%
  select(year,
         measure_name,location_name,
         location_id,cause_name,
         val)
dat <- rbind(a,b,c) %>%
  mutate(measure_name=case_when(
    measure_name=="DALYs (Disability-Adjusted Life Years)"~"DALYs",
    measure_name=="YLLs (Years of Life Lost)"~"YLLs",
    measure_name=="YLDs (Years Lived with Disability)"~"YLDs",
    .default = measure_name)
  )%>%
  pivot_wider(names_from = measure_name,values_from = val)

infectious_diseases <- dat %>%
  filter(location_name %in% c("Lesotho",
                              "Eswatini",
                              "Malawi",
                              "Central African Republic",
                              "Zambia"))

usethis::use_data(infectious_diseases,
                  overwrite = TRUE)
devtools::document()
