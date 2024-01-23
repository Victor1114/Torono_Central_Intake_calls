#### Preamble ####
# Purpose: Get data on 2023 central intake calls and make table
# Author: Yuchen Chen
# Email: victorchen.chen@mail.utoronto.ca
# Date: 21 January 2024
# Prerequisites: -
install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("janitor")

library(opendatatoronto)
library(tidyverse)
library(janitor)

#### Acquire ####
toronto_intake_calls_2023 <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/central-intake-calls/
  list_package_resources("central-intake-calls") |>
  # Within that package, we are interested in the 2023 dataset
  filter(name == "Central Intake Service Queue Data") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()|> filter(Date>=2023)

write_csv(
  x = toronto_intake_calls_2023,
  file = "inputs/data/oringinal_data.csv"
)

head(toronto_intake_calls_2023)


toronto_intake_calls_2023_clean <-
  clean_names(toronto_intake_calls_2023) |>
  mutate(calls_date = ymd(date)) |> 
  select(calls_date, unmatched_callers)

head(toronto_intake_calls_2023_clean)

write_csv(
  x = toronto_intake_calls_2023_clean,
  file="outputs/data/edited_data.csv"
)