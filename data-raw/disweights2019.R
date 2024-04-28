# Health Metrics - Disability Weights for 2019
# For the 440 health states estimation of nonfatal health outcomes.
library(tidyverse,quietly = T)
data <- readxl::read_xlsx("inst/extdata/ihme/IHME_GBD_2019_DISABILITY_WEIGHTS_Y2020M010D15.XLSX")
names(data)<- data[1,]
data <- data[-1,]
# head(data)
names(data) <-  c("sequela","specification","description","dw")


infectious_disease_dw <- data %>%
  mutate(severity=str_extract(specification,"mild|moderate|severe"),
         specification=gsub(", mild|, moderate|, severe","",
                            specification),
         .after=specification)%>%
  filter(str_detect(specification,"Infectious disease"))

lungcancer_dw <- data %>%
  mutate(severity=str_extract(specification,"mild|moderate|severe"),
         specification=gsub(", mild|, moderate|, severe","",
                            specification),
         .after=specification)%>%
  filter(str_detect(sequela,"lung"),
         str_detect(specification,"Cancer"))

tuberculosis_dw <- data %>%
  mutate(severity=str_extract(specification,"mild|moderate|severe"),
         specification=gsub(", mild|, moderate|, severe","",
                            specification),
         .after=specification)%>%
  filter(str_detect(specification,"Tuberculosis"))

stroke_dw <- data %>%
  mutate(severity=str_extract(specification,"mild|moderate|severe"),
         specification=gsub(", mild|, moderate|, severe","",
                            specification),
         .after=specification)%>%
  filter(str_detect(specification,"Stroke"))

dw2019 <- bind_rows(infectious_disease_dw,lungcancer_dw,tuberculosis_dw,stroke_dw)

disweights2019 <- dw2019 %>%
  select(-description)%>%
  separate(specification,into = c("cause1","cause2"),
           sep = ",",
           remove = F)%>%
  mutate(cause2=trimws(cause2),
         cause2=gsub(" .*","",cause2),
         severity=ifelse(is.na(severity),"combined",severity))%>%
  separate(dw,
           into = c("dw","ci"),
           sep = "\r\n",
           remove = T)%>%
  separate(ci,
           into = c("upper","lower"),
           sep = "-",
           remove = T)%>%
  mutate(upper=str_extract(upper,"\\d+\\.*\\d*"),
         lower=str_extract(lower,"\\d+\\.*\\d*"))%>%
  mutate(dw=as.double(dw),
         upper=as.double(upper),
         lower=as.double(lower))


usethis::use_data(disweights2019, overwrite = TRUE)
devtools::document()
