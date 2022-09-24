
set.seed(2019)
test_df <- list(sid = rep(c(1L, 2L, 3L), 7),
     event_time = rep(seq(Sys.time(),Sys.time() + 6, by = "sec"), 3),
     location_num = sample(letters[1:2], 21, replace = TRUE)) %>%
  as.data.frame()




  # .Names = c("ID", "event_time"),
  # sorted = c("ID", "event_time"),
  # class = c("data.table", "data.frame")
# )
test_df %>% left_join(test_df, by = c("event_time", "location_num"), suffix = c(x = "_i", y = "_j")) %>% filter(sid_i != sid_j)


colocation_maker <- function(x, by_cols) {
  x %>%
    left_join(x, by = by_cols,
              suffix = c(x = "_i", y = "_j")) %>%
    filter(sid_i != sid_j)
}



dat_colocations <- colocation_maker(dat,
                                     by_cols = c("location_num",
                                                 "datetime"))






# How to find colocation events (edges) between individuals (vertices) from real-time location data in r
# This is my first question, please advise as needed.
#
# I am working with real-time location data including actor_id, shift_id, location_id, and timestamp. I need a way to create a data frame where, for each shift_id group, every row is an event where two or more actors were colocated (i.e., in the same place at the same time). The result I am looking for is a data frame with the variables: actor_id_1, actor_id_2, shift_id, location_id, colocation_start_time, and colocation_end_time.
# ```
#
# ```

