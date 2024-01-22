#### Preamble ####
# Purpose: Get data on 2023 central intake calls and make table
# Author: Yuchen Chen
# Email: victorchen.chen@mail.utoronto.ca
# Date: 21 January 2024
# Prerequisites: -

#### Workspace setup ####
install.packages("tidyverse")
library(tidyverse)

#### Simulate ####
set.seed(853)

simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    # Based on : 
    #https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
    types_call = c(
      rep(x = "Unmatched callers", times = 365),
      rep(x = "Single call", times = 365),
      rep(x = "Repeat caller", times = 365)
    ),
    number_occupied =
      rpois(
        n = 365 * 3,
        lambda = 30
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_occupancy_data)