#### Preamble ####
# Purpose: Simulates the data of shelter programs
# Author: Kenneth Chan
# Date: 22 January 2024
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(124)

# Based on Rohan Alexander: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate-1
simulated_occupancy_data <-
  tibble(
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    city = c(
      rep(x = "City 1", times = 365*2),
      rep(x = "City 2", times = 365*2),
      rep(x = "City 3", times = 365*2)
    ),
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 6),
    program_area = c(
      rep(x = "Program 1", times = 365*3),
      rep(x = "Program 2", times = 365*3)
    ),
    unoccupied_rooms =
      rpois(
        n = 365 * 6,
        lambda = 100
      ), # Draw 1,095 times from the Poisson distribution
    total_shelter_programs =
      rpois(
        n = 365 * 6,
        lambda = 10
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_occupancy_data)



