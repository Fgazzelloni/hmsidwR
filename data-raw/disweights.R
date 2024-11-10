# Health Metrics - Disability Weights for 2019
# For the 440 health states estimation of non fatal health outcomes.
library(tidyverse, quietly = T)
# download the 2019 data and read it
disweights19_raw <- readxl::read_xlsx("inst/extdata/ihme/disweights19_raw.XLSX",
                            skip=1) %>%
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

# download the 2021 data and read it
disweights21_raw <- read_csv("inst/extdata/ihme/disweights21_raw.csv")%>%
  janitor::clean_names() %>%
  mutate(year=2021)%>%
  rename(sequela = sequela_name, dw = mean)

data <- bind_rows(disweights19_raw, disweights21_raw)
data <- data[,-3]
names(data) <- c("sequela", "specification", "dw", "upper", "lower", "year")

# infectious_disease
infectious_disease_dw <- data %>%
  mutate(severity = str_extract(specification,
                                "mild|moderate|severe"),
         specification = gsub(", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Infectious disease"))

# lungcancer
lungcancer_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(sequela, "lung"),
         str_detect(specification, "Cancer"))

# tuberculosis
tuberculosis_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Tuberculosis"))

# stroke
stroke_dw <- data %>%
  mutate(severity = str_extract(specification, "mild|moderate|severe"),
         specification = gsub(
         ", mild|, moderate|, severe", "",
         specification),.after = specification) %>%
  filter(str_detect(specification, "Stroke"))

# bind_rows
dw <- bind_rows(infectious_disease_dw, lungcancer_dw,
                tuberculosis_dw, stroke_dw)

# separate the cause1 and cause2
disweights <- dw %>%
  separate(specification,
           into = c("cause1", "cause2"),
           sep = ",",
           remove = F) %>%
  mutate(cause2 = trimws(cause2),
         cause2 = gsub(" .*", "", cause2),
         severity = ifelse(is.na(severity),
                           "mean", severity))

# save the data
usethis::use_data(disweights,
                  compress = "xz",
                  overwrite = TRUE)
devtools::document()
