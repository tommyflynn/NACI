wd <- getwd()
shifts_dir <- paste0(wd, "/Data/shifts")
date_shiftnum <- read_sas(paste0(shifts_dir, "/date_shiftnum.sas7bdat"))
date_shiftnum
population_730 %>%
  left_join(date_shiftnum, by = c("arrival_date" = "date")) %>%
  left_join(date_shiftnum, by = c("departure_date" = "date")) %>%
  count(arrival_date) %>%
  arrange(arrival_date)
population_81 %>%
  count(arrival_dttm) %>%
  arrange(desc(n))
population_81 %>%
  names()
population_730 %>%
  full_join(population_81, (by = c("encounter_no", "sex", "age", "race", "chief_complaint", "acuity", "arrival_mode", "arrival_cat", "disposition"))) %>%
  count(encounter_no) %>%
  filter(n > 1) %>%
  arrange(desc(n))
population_81 %>%
  count(encounter_no) %>%
  arrange(desc(n))
population_81 %>%
  names()
