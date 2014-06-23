#This is the server logic for an interactive uniform distribution plot

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  rng<-seq(0,20,0.1)
  rngdf<-data.frame(rng)
  gammaplot<-ggplot(data=rngdf,aes(x=rng))+
    ylab("Density")+xlab("Range of values")+ggtitle("Gamma Density")+coord_cartesian(xlim=c(-0.5,20),ylim=c(-0.0005,0.8))
  ourcolor<-"#4b0082"
  output$gammaPlot<-renderPlot({
    
    #make a normal distribution based on inputs.
    yvals=dgamma(x=rng,shape=input$alpha,scale=input$beta)
    ydf<-data.frame(rng,yvals)
    gammaplot+
      geom_ribbon(data=ydf,aes(ymin=0,ymax=yvals),fill=ourcolor,color=ourcolor)
    #+stat_function(fun=dchisq,args=list(df=input$df),color="black")
  })
  
  
  
})
