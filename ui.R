# 
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

update.packages("shiny")
library(shiny)

# Define the UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond price calculator"),
  
  # Sidebar with characteristics
  sidebarLayout(
    sidebarPanel(
      h6("Please fill in the characteristics and press the submitbutton"),
      sliderInput("carat","carat", 0.3, 2, 0.01),
      
      selectInput("cut", 
                  h6("cut"), 
                  list("Fair" = "Fair",
                      "Very Good" = "Very Good",
                      "Ideal" = "Ideal")),
      selectInput("color", 
                  h6("color"), 
                  list("D" = "D",
                      "G" ="G",
                      "J" = "J")),
      selectInput("clarity", 
                  h6("clarity"), 
                  list("I1" = "I1", 
                       "VS1" = "VS1",
                       "IF" = "IF" )),
      
      submitButton("Click here, I will show you the money!!")
    ),
    
    # Output
    mainPanel(
      h3("Your diamond is worth between:"),
      h2(textOutput("worth")),
      h3("and:"),
      h2(textOutput("worth2")),
      h6("(Never forget; Diamonds are a girl's best friend)")

    )
  )
))
