


drg_data <- drg_data %>%
  mutate(drg_code=substr(DRG.Definition,start=1,stop=3))

## function 1
boxplot <- function(y){
  drg_data %>%
    select(drg_code, y=y)%>%
    ggplot( mapping = aes(x= drg_code, y = y) )+ #  Make three payment as an option for function
    geom_boxplot()+
    scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
    labs(x = "DRG code",
         y = y,
         title = "Boxplot of payments by DRG code")  ## rename x, y axis and title

}

boxplot("Average.Total.Payments")
boxplot("Average.Covered.Charges")
