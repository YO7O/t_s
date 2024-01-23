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
  select(location_city, unoccupied_rooms, occupancy_date) |>
  tidyr::drop_na()|> # drop all non valid entry
  rename(city = location_city, date = occupancy_date) |>
  group_by(city, date) |>
  summarise(shelter_program_with_space = sum(unoccupied_rooms != 0), # Count the number of distinct program in each different shelter with space left
            total_shelter_program = n(), # Count the total number of distinct program in each different shelter
            percentage_full = mean(unoccupied_rooms == 0) * 100 # The percentage of distinct program that is full.
            )g

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
