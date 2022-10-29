drg_data <- read.csv("DRG_data.csv")

drg_data <- drg_data %>%
  mutate(drg_code=substr(DRG.Definition,start=1,stop=3))

save(drg_data, file = 'data/DRG.RData')
