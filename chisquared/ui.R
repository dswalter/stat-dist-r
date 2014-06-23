#UI for a Chi-squared distribution

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Interactive Chi Squared Density"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("df","Degrees of Freedom",min=1,max=50,value=1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("chisqPlot")
    )
  )
))
