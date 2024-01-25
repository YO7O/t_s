#### Preamble ####
# Purpose: Tests the data of shelter programs
# Author: Kenneth Chan
# Date: 22 January 2024
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
shelter_data <- read_csv("outputs/data/analysis_data.csv")

# Check if all data is from five cities around GTA
shelter_data$program_area |>
  unique() == c("COVID-19 Response",
                "Temporary Refugee Response",
                "Base Program - Refugee",
                "Base Shelter and Overnight Services")

shelter_data$city |>
  unique() == c("Etobicoke", "North York", "Scarborough", "Toronto", "Vaughan")

# Check if total days is 365 days
shelter_data$date |>
  unique() |>
  length() == 365

# Check if the amount of unoccupied rooms is greater than 0 on all entries
all(shelter_data$unoccupied_rooms >= 0)

# Check if occupancy rate is less than 100 on all entries
all(shelter_data$occupancy_rate <= 100)
