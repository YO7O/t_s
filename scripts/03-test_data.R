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

shelter_data$city |>
  unique() == c("Etobicoke", "North York", "Scarborough", "Toronto", "Vaughan")

shelter_data$date |>
  unique() |>
  length() == 365

all(shelter_data$shelter_program_with_space <= shelter_data$total_shelter_program)

all.equal(
  shelter_data$percentage_full,
  (1 - shelter_data$shelter_program_with_space / shelter_data$total_shelter_program) * 100)

