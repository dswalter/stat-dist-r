
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  #output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
   # x    <- faithful[, 2]
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
  #  hist(x, breaks = bins, col = 'darkgray', border = 'white')

  #})

  rng<-seq(-250,250,0.1)
  rngdf<-data.frame(rng)
  tplot<-ggplot(data=rngdf,aes(x=rng))+xlim(-75,75)+
    ylab("Density")+xlab("Range of X values")+ggtitle("T density")
  
  
  output$tPlot<-renderPlot({
    
    #make a normal distribution based on inputs.
    tplot+stat_function(fun=dt,args=list(df=input$df),color="black")
  })
  
  
  
})
