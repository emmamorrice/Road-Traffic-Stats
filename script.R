##installing packages needed
install.packages("stats19")
remotes::install_github("ropensci/stats19")
install.packages("rstudioapi")
install.packages("dplyr")

#importing libraries
library(pct)      # access travel data from DfT-funded PCT project 
library(sf)       # spatial vector data classes
library(stats19)  # get stats19 data
library(stplanr)  # transport planning tools
library(tidyverse)# packages for 'data science'
library(tmap)     # interactive maps
library(dplyr)

## LOADING IN THE DATASETS FOR THE PAST 10 YEARS, ALL TYPES ##

#accidents years - filtering to A road and Police Scotland to get data down to manageable number
accidents_22 = get_stats19(year = 2022, type = 'Collision')
accidents_22filtered= accidents_22 %>%
  filter(first_road_class == "A") %>%
  filter(police_force =="Police Scotland")

accidents_21= get_stats19(year = 2021, type = 'Collision')
accidents_21filtered= accidents_21 %>%
  filter(first_road_class == "A") %>%
  filter(police_force =="Police Scotland")

accidents_20= get_stats19(year = 2020, type = 'Collision')
accidents_20filtered= accidents_20 %>%
  filter(first_road_class == "A") %>%
  filter(police_force =="Police Scotland")

accidents_19= get_stats19(year = 2019, type = 'Collision')
accidents_19filtered= accidents_19 %>%
  filter(first_road_class == "A") %>%
  filter(police_force =="Police Scotland")

accidents_18= get_stats19(year = 2018, type = 'Collision')
accidents_18filtered= accidents_18 %>%
  filter(first_road_class == "A") %>%
  filter(police_force =="Police Scotland")


##casualties years datasets
casualties_22= get_stats19(year = 2022, type = 'casualty')
casualties_21= get_stats19(year = 2021, type = 'casualty')
casualties_20= get_stats19(year = 2020, type = 'casualty')
casualties_19= get_stats19(year = 2019, type = 'casualty')
casualties_18= get_stats19(year = 2018, type = 'casualty')


##vehicles years datasets 
vehicles_22= get_stats19(year = 2022, type = 'Vehicle')
vehicles_21= get_stats19(year = 2021, type = 'Vehicle')
vehicles_20= get_stats19(year = 2020, type = 'Vehicle')
vehicles_19= get_stats19(year = 2019, type = 'Vehicle')
vehicles_18= get_stats19(year = 2018, type = 'Vehicle')

vehicles_20= dl_stats19(year = 2020, type = 'Vehicle')
vehicles_19= dl_stats19(year = 2019, type = 'Vehicle')
vehicles_18= dl_stats19(year = 2018, type = 'Vehicle')


## MERGING DATASETS SO THERE'S ONE FOR EACH YEAR##


### EXPORTING ###
write.csv(accidents_22filtered, "accidents22filtered.csv", row.names = FALSE)
write.csv(accidents_21filtered, "accidents21filtered.csv", row.names = FALSE)
write.csv(accidents_20filtered, "accidents20filtered.csv", row.names = FALSE)
write.csv(accidents_19filtered, "accidents19filtered.csv", row.names = FALSE)
write.csv(accidents_18filtered, "accidents18filtered.csv", row.names = FALSE)

write.csv(casualties_22, "casualties22.csv", row.names = FALSE)
write.csv(casualties_21, "casualties21.csv", row.names = FALSE)
write.csv(casualties_20, "casualties20.csv", row.names = FALSE)
write.csv(casualties_19, "casualties19.csv", row.names = FALSE)
write.csv(casualties_18, "casualties18.csv", row.names = FALSE)

write.csv(vehicles_22, "vehicles22.csv", row.names = FALSE)
write.csv(vehicles_21, "vehicles21.csv", row.names = FALSE)
write.csv(vehicles_19, "vehicles19.csv", row.names = FALSE)
write.csv(vehicles_18, "vehicles18.csv", row.names = FALSE)


