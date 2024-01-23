#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


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

