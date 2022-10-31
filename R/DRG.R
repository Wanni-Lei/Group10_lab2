library(ggplot2)
library(tidyverse)

## function 1
#' boxplot
#' This function produces a ggplot plot of \code{payment} versus \code{drg_code}
#' with boxplot markers.
#'
#' @param y payment
#' @param drg_code a string name for variable x in the dataframe y
#' @param payment a string name for variable y in the dataframe y
#'
#' @return A plot with boxplot markers of \code{payment} versus \code{drg_code}
#' @export
#'
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_boxplot
#'
#' @examples
#' boxplot("Average.Covered.Charges")
#'
boxplot <- function(y){

  sample_data %>%
    select(drg_code, y=y) %>% # select DRG code and payment for next step drawing
    ggplot(mapping = aes(x= drg_code, y = y) )+ #  Make three payment as an option for function
    geom_boxplot()+
    #scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
    theme_minimal() +
    theme(axis.text.x = element_text(size = 5,
                                  angle = 90), legend.position = "none")+
    labs(x = "DRG code",
         y = "Payments",
         title = "Boxplot of payments by DRG code")  ## rename x, y axis and title

}


#boxplot("Average.Covered.Charges")


## function2
#' statistics
#' This function produces a function of calculates statistics over all of the DRG codes for Average Medicare Payments
#'
#' @param x statistics over all of the DRG codes for average Medicare payments
#'
#' @return The mean, median, or standard deviation of the DRG codes
#' @export
#'
#' @examples
#' statistics("sd")
#'
statistics<- function(x){

  if(x=="mean"){
    table <- sample_data %>%
      summarise(mean = mean(Average.Medicare.Payments)) # calculate the mean
    table
  }
  else if (x == "median"){
    table <- sample_data %>%
      summarise(median = median(Average.Medicare.Payments)) # calculate the median
    table
  } else if (x == "sd"){
    table <- sample_data %>%
      summarise(SD = sd(Average.Medicare.Payments)) # calculate the SD

    table
  } else{
    print("Error! Function can only return mean, median and sd.")
  }
}

## statistics("sd")
