# Health Metrics - Disability Weights for 2019
# For the 440 health states estimation of nonfatal health outcomes.
library(tidyverse, quietly = T)
# you need to be logged in to download the file
# URL of the CSV file
# url <- "https://ghdx.healthdata.org/sites/default/files/record-attached-files/IHME_GBD_2021_DISABILITY_WEIGHTS_Y2024M05D13.CSV"
# download the data and read it
data19 <- readxl::read_xlsx("inst/extdata/ihme/IHME_GBD_2019_DISABILITY_WEIGHTS_Y2020M010D15.XLSX",
                            skip=1) %>%View
  janitor::clean_names() %>%
  mutate(year=2019)%>%
  separate(disability_weight,
           into = c("dw", "ci"),
           sep = "\r\n",
           remove = T) %>%
  separate(ci,
           into = c("upper", "lower"),
           sep = "-",
           remove = T) %>%
  mutate(upper = str_extract(upper, "\\d+\\.*\\d*"),
         lower = str_extract(lower, "\\d+\\.*\\d*")) %>%
  mutate(dw = as.double(dw),
         upper = as.double(upper),
         lower = as.double(lower))
names(data19)
data21 <- read_csv("inst/extdata/ihme/IHME_GBD_2021_DISABILITY_WEIGHTS_Y2024M05D13.csv")%>%
  janitor::clean_names() %>%
  mutate(year=2021)%>%
  rename(sequela = sequela_name, dw = mean)
names(data21)

data <- bind_rows(data19, data21)
names(data)
data <- data[,-3]
# head(data)
names(data) <- c("sequela", "specification", "dw", "upper", "lower", "year")


infectious_disease_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Infectious disease"))

lungcancer_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(sequela, "lung"),
         str_detect(specification, "Cancer"))

tuberculosis_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Tuberculosis"))

stroke_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Stroke"))

dw <- bind_rows(infectious_disease_dw, lungcancer_dw,
                tuberculosis_dw, stroke_dw)

disweights <- dw %>%
  separate(specification,
           into = c("cause1", "cause2"),
           sep = ",",
           remove = F) %>%
  mutate(cause2 = trimws(cause2),
         cause2 = gsub(" .*", "", cause2),
         severity = ifelse(is.na(severity),
                           "mean", severity))


usethis::use_data(disweights, overwrite = TRUE)
devtools::document()
