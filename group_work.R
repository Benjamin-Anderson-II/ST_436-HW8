library(nycflights13)
library(tidyverse)

flights |>
  group_by(dest) |>
  summarize(
    # Does not skip row if arr_delay is NA.
    any_late_arrival = any(arr_delay >= 30, na.rm = TRUE),
    all_early_depart = all(dep_delay < 0, na.rm = TRUE),
    .groups = "drop"
  )