suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(data.table))
# data represent interactions between a pair of nodes such that each row is one second of one interaction for a specific dyad (`id`)
df <- tibble(datetime = as_datetime(1511870400:1511870409)) %>%
  mutate(id = c(rep("x_1", 4), rep("x_2", 3), rep("x_1", 2), "x_2"), rl = rleid(id))
# rleid sets a unique numeric identifier for each interaction or run of events (consecutive rows with shared ID)
df
# grouped summarize to get the start_datetime, end_datetime, & duration of each interaction/event
events <- df %>%
  group_by(rl) %>%
  summarize(start_date = min(datetime),
            end_date = max(datetime),
            duration = difftime(end_date, start_date, "second"))
events
# join events to df so each row represents a single interaction with start_date, end_date, & duration
df %>%
  right_join(events, by = "rl") %>%
  distinct(rl, .keep_all = TRUE) %>%
  select(-datetime)
