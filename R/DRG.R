library(ggplot2)
library(tidyverse)

## function 1
boxplot <- function(y){

  sample_data %>%
    select(drg_code, y=y) %>%
    ggplot(mapping = aes(x= drg_code, y = y) )+ #  Make three payment as an option for function
    geom_boxplot()+
    scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
    labs(x = "DRG code",
         y = "Payments",
         title = "Boxplot of payments by DRG code")  ## rename x, y axis and title

}


#boxplot("Average.Covered.Charges")


## function2
statistics<- function(x){

  if(x=="mean"){
    table <- sample_data %>%
      summarise(mean = mean(Average.Medicare.Payments))
    table
  }
  else if (x == "median"){
    table <- sample_data %>%
      summarise(median = median(Average.Medicare.Payments))
    table
  } else{
    table <- sample_data %>%
      summarise(SD = sd(Average.Medicare.Payments))

    table
  }
}

## statistics("sd")
