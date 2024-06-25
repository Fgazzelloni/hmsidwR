## Health Metrics - Germany lung cancer dataset
library(tidyverse, quietly = T)
germany_lungc <- hmsidwR::deaths2019 %>%
  filter(
    location == "Germany",
    str_detect(cause, "lung")
  ) %>%
  select(-location, -cause)


library(readxl)
prev_lungcancer_germany2019 <- read_excel("inst/extdata/ihme/prev_lungcancer_germany2019.xlsx")


germany_lungc <- prev_lungcancer_germany2019 %>%
  janitor::clean_names() %>%
  select(age, sex, value, upper, lower) %>%
  rename(
    prevalence = value,
    prev_upper = upper,
    prev_lower = lower
  ) %>%
  mutate(
    age = gsub(" .*", "", age),
    age = gsub("1-4", "01-04", age),
    age = gsub("5-9", "05-09", age),
    age = gsub("<1", "-01", age),
    sex = tolower(sex),
    sex = case_when(
      sex == "both sexes" ~ "both",
      sex == "females" ~ "female",
      sex == "males" ~ "male"
    )
  ) %>%
  full_join(germany_lungc, by = c("age", "sex")) %>%
  rename(dx_uppe = upper, dx_lower = lower)



usethis::use_data(germany_lungc, overwrite = TRUE)
devtools::document()
