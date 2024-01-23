#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Kenneth Chan
# Date: 22 January 2024
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


citation()
citation("opendatatoronto")
citation("ggplot2")
citation("janitor")

#### Simulate data ####
set.seed(124)

simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    city = c(
      rep(x = "City 1", times = 365),
      rep(x = "City 2", times = 365),
      rep(x = "City 3", times = 365)
    ),
    shelter_with_space =
      rpois(
        n = 365 * 3,
        lambda = 10
      ), # Draw 1,095 times from the Poisson distribution
    total_shelter_number =
      rpois(
        n = 365 * 3,
        lambda = 100
      ), # Draw 1,095 times from the Poisson distribution
    percentage_full = 
      (1 - shelter_with_space/total_shelter_number) * 100
  )

head(simulated_occupancy_data)



