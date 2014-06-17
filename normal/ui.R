
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Interactive Normal Density"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      #sliderInput("bins",
       #           "Number of bins:",
        #          min = 1,
         #         max = 50,
          #        value = 30),
      sliderInput("imean","Mean",min=-50,max=50,value=0),
      sliderInput("isdev","Standard deviation",min=4,max=25,value=10,step=0.5)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("normPlot")
    )
  )
))
