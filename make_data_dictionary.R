library(haven)
library(tidyverse)
library(lubridate)
library(data.table)
rdata_dir <- paste0(getwd(), "/Data/Rdata/")

# population.Rdata
population <- read_rds(paste0(rdata_dir, "population.Rdata"))
# glimpse(population)
# names(population)
# demographics.Rdata
demographics <- read_rds(paste0(rdata_dir, "demographics_clean.Rdata"))
# glimpse(demographics)

# pts_all.Rdata
pts_all <- read_rds(paste0(rdata_dir, "pts_all.Rdata"))
# glimpse(pts_all)
# names(pts_all)
test <- population %>%
  full_join(pts_all, by = c("encounter_no",
                            "sex",
                            "age",
                            "race",
                            "chief_complaint",
                            "acuity",
                            "arrival_mode",
                            "arrival_cat",
                            "disposition"))
# glimpse(test)
all_pts <-  test %>%
  unnest(cols = "nested_loc", keep_empty = TRUE) # %>%
  # glimpse()
# pts_all == pts_nested




# staff_all == staff_locs_nested
staff_all <- read_rds(paste0(rdata_dir, "staff_all.Rdata"))
# glimpse(staff_all)

all_staff <- staff_all %>%
  unnest(cols = nested_loc, keep_empty = TRUE)

# what file format do data need to for uploading to google cloud???
write_rds(all_pts, file = "all_pts.Rdata")
write_rds(all_staff, file = "all_staff.Rdata")
