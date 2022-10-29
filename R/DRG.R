
## function 1
boxplot <- function(y){
  DRG %>%
    select(drg_code, y=y) %>%
    ggplot( mapping = aes(x= drg_code, y = y) )+ #  Make three payment as an option for function
    geom_boxplot()+
    scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
    labs(x = "DRG code",
         y = y,
         title = "Boxplot of payments by DRG code")  ## rename x, y axis and title

}


#boxplot("Average.Covered.Charges")


## function2
statistics<- function(x){

  if(x=="mean"){
    table <-drg_data %>%
      summarise(mean = mean(Average.Medicare.Payments))
    table
  }
  else if (x=="median"){
    table <-drg_data %>%
      summarise(median = median(Average.Medicare.Payments))
    table
  } else{
    table <-drg_data %>%
      summarise(SD = sd(Average.Medicare.Payments))

    table
  }
}

statistics("sd")
