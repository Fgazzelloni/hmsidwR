## Global Health Observatory (GHO) - Global region lifetables 2000-2019

library(tidyverse,quietly = T)
# xmart <- read_csv("/Users/macintoshhd/Documents/R/R_general_resources/Spatials/infectious/data-raw/xmart.csv")
lifetb <- read_csv("https://apps.who.int/gho/athena/data/data-verbose.csv?target=GHO/LIFE_0000000029,LIFE_0000000030,LIFE_0000000031,LIFE_0000000032,LIFE_0000000033,LIFE_0000000034,LIFE_0000000035&profile=verbose&filter=REGION:GLOBAL;COUNTRY:-&ead=")

gho_lifetables <- lifetb%>% # View
  janitor::clean_names()%>%
  select(gho_display,year_display,agegroup_display,sex_display,display_value)%>%
  rename_with(~gsub("_display|display_","",.x))%>% #count(gho)
  mutate(agegroup=gsub(" .*", "", agegroup),
         sex=ifelse(sex=="Both sexes","both",sex),
         sex=tolower(sex))%>%
  rename(age=agegroup,indicator=gho)


usethis::use_data(gho_lifetables, overwrite = TRUE)
devtools::document()
