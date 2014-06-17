
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
  normalplot<-ggplot(data=rngdf,aes(x=rng))+xlim(-75,75)+ylim(0,0.10)+
    ylab("Density")+xlab("Range of X values")+ggtitle("Normal Density")
  
  
  output$normPlot<-renderPlot({
    
    #make a normal distribution based on inputs.
    normalplot+stat_function(fun=dnorm,args=list(mean=input$imean,sd=input$isdev),color="black")
  })
  
  
  
})
