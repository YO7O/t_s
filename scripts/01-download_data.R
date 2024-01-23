#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Kenneth Chan
# Date: 22 January 2024
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

citation("ggplot2")

#### Download data ####
# Based on Rohan Alexander: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-1
# Source data: https://open.toronto.ca/dataset/daily-shelter-overnight-service-occupancy-capacity/
raw_shelter_data <-
  # Get data from opendatatoronto using unique id in "For Developers" tab
  list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2") |>
  # Using the 2023 dataset
  filter(name == "daily-shelter-overnight-service-occupancy-capacity-2023.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()



#### Save data ####
write_csv(raw_shelter_data, "inputs/data/raw_data.csv") 

         
