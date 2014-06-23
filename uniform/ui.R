#UI for a Gamma distribution

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Interactive Gamma Density"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("alpha","Shape, or Alpha",min=0.1,max=4,value=1,step=0.1),
      sliderInput("beta","Scale, or Beta",min=0.1,max=3,value=1,step=0.1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("gammaPlot"),
      p("When the shape parameter (alpha) is less than or equal to 1, the density is purely decreasing. When the shape parameter
        is greater than or equal to one, however, it is a unimodal distribution that is skewed to the right."),
      p("Based on the shape parameter, the scale parameter changes the width of the distribution.")
    )
  )
))
