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
shelter_data$city |>
  unique() == c("Etobicoke", "North York", "Scarborough", "Toronto", "Vaughan")

# Check if total days is 365 days
shelter_data$date |>
  unique() |>
  length() == 365

# Check if amount of distinct program in different shelter with space is smaller 
# or equal to the total amount of distinct program in different shelter
all(shelter_data$shelter_program_with_space <= shelter_data$total_shelter_program)

# Check if the full percentage match with other variables
all.equal(
  shelter_data$percentage_full,
  (1 - shelter_data$shelter_program_with_space / shelter_data$total_shelter_program) * 100)
