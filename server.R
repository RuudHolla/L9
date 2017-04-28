#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

update.packages("shiny")
library(shiny)

library(dplyr)
library(ggplot2)

# Dataset
Dataset <- diamonds[,c(1:4,7)]

# Define server logic required to computate the output
shinyServer(function(input, output) {

  
  # Calculate first prediction
  output$worth <- renderText({
    
    Dataset <- filter(diamonds, 
                      grepl(input$cut, cut), 
                      grepl(input$color, color), 
                      grepl(input$clarity, clarity)
                      )
    
    linmod <- lm(price~carat, Dataset)
    
    firstprediction <- predict(linmod, 
                               data.frame (carat = input$carat,
                                                    cut = input$cut,
                                                    color = input$color,
                                                    clarity = input$clarity)
                                )
    
    answer <- paste("$" ,round(firstprediction*.98, digits = 0))
    
  })
  
  # Calculate second prediction
  output$worth2 <- renderText({
    
    Dataset <- filter(diamonds, 
                      grepl(input$cut, cut), 
                      grepl(input$color, color), 
                      grepl(input$clarity, clarity)
    )
    
    linmod <- lm(price~carat, Dataset)
    
    secondprediction <- predict(linmod, 
                               data.frame (carat = input$carat,
                                           cut = input$cut,
                                           color = input$color,
                                           clarity = input$clarity)
    )
    answer <- paste("$" ,round(secondprediction*1.02, digits = 0))
    
  })
  
  
})




