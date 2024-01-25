#### Preamble ####
# Purpose: Cleans the raw shelter data recorded from opendatatoronto
# Author: Kenneth Chan
# Date: 22 January 2024
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(location_city, unoccupied_rooms, occupancy_date, program_area, occupancy_rate_rooms) |>
  tidyr::drop_na()|> # drop all non valid entry
  rename(city = location_city, date = occupancy_date) |>
  group_by(city, date, program_area) |>
  summarise(unoccupied_rooms = sum(unoccupied_rooms), # Count the number unoccupied rooms
            total_shelter_program = n(), # Count the total number of distinct program
            occupancy_rate = occupancy_rate_rooms
            )

cleaned_data$program_area[cleaned_data$program_area == "Base Shelter and Overnight Services System"] <- "Base Shelter and Overnight Services"

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")

