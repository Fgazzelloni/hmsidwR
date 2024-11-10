# Source: IHME GBD Results for Infectious Diseases Deaths and YLLs from 1980 to 1999
library(tidyverse)
inf_dis_80_21_1_raw <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21_1_raw.csv")

a <- inf_dis_80_21_1_raw %>%
  select(year,measure_name, location_name,
         location_id, cause_name, val)

inf_dis_80_21_2_raw <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21_2_raw.csv")

b <- inf_dis_80_21_2_raw %>%
  select(year,measure_name, location_name,
         location_id, cause_name, val)

inf_dis_80_21_3_raw <- read_csv("inst/extdata/ihme/infectious_diseases/inf_dis_80_21_3_raw.csv")

c <- inf_dis_80_21_3_raw %>%
  select(year,measure_name, location_name,
         location_id, cause_name, val)

dat <- rbind(a, b, c) %>%
  mutate(measure_name = case_when(
    measure_name == "DALYs (Disability-Adjusted Life Years)" ~ "DALYs",
    measure_name == "YLLs (Years of Life Lost)" ~ "YLLs",
    measure_name == "YLDs (Years Lived with Disability)" ~ "YLDs",
    .default = measure_name)) %>%
  pivot_wider(names_from = measure_name, values_from = val)

write_csv(dat, "inst/extdata/ihme/infectious_diseases/inf_dis_80_21.csv")
