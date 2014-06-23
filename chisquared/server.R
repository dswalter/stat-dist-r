#This is the server logic for an interactive chi squared distribution plot.

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  rng<-seq(0,75,0.1)
  rngdf<-data.frame(rng)
  chisqplot<-ggplot(data=rngdf,aes(x=rng))+
    ylab("Density")+xlab("Range of values")+ggtitle("Chi Squared Density")+coord_cartesian(xlim=c(-0.5,75),ylim=c(-0.0005,0.25))
  
  output$chisqPlot<-renderPlot({
    
    #make a normal distribution based on inputs.
    yvals=dchisq(x=rng,df=input$df)
    ydf<-data.frame(rng,yvals)
    chisqplot+
      geom_ribbon(data=ydf,aes(ymin=0,ymax=yvals),fill="#00868B",color="#00868B")
    #+stat_function(fun=dchisq,args=list(df=input$df),color="black")
  })
  
  
  
})
