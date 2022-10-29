## code to prepare `DATASET` dataset goes here
drg_data <- read.csv("DRG_data.csv")

sample_data <- drg_data %>%
  mutate(drg_code=substr(DRG.Definition,start=1,stop=3))



usethis::use_data(sample_data, overwrite = TRUE)
