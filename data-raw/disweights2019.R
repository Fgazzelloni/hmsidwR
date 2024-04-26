# Health Metrics - Disability Weights for 2019
# For the 440 health states estimation of nonfatal health outcomes.
library(tidyverse,quietly = T)
data <- readxl::read_xlsx("inst/extdata/ihme/IHME_GBD_2019_DISABILITY_WEIGHTS_Y2020M010D15.XLSX",
                          col_names = F,skip = 2)
names(data)<- c("sequela","specification","description","dw")
# data%>%count(sequela,sort=T)
# data%>%count(specification,sort=T)
# data%>%count(description,sort=T)
# data%>%View
disweights2019 <- data%>%
  mutate(severity=str_extract(specification,"mild|moderate|severe"),
         specification=gsub(", mild|, moderate|, severe","",
                            specification),
         .after=specification)%>%#count(specification,sort=T)%>%View
  filter(str_detect(specification,"Stroke|Tuberculosis|Infectious disease"))%>%
  select(specification,severity,dw)%>%
  separate(specification,into = c("cause1","cause2"),
           sep = ",",
           remove = F)%>%
  mutate(cause2=trimws(cause2))%>%
  mutate(cause2=gsub(" .*","",cause2),
         cause2=ifelse(cause2=="HIV","HIV",NA))%>%
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
  distinct()%>%
  mutate(dw=as.double(dw),
         upper=as.double(upper),
         lower=as.double(lower))


usethis::use_data(disweights2019, overwrite = TRUE)
devtools::document()
