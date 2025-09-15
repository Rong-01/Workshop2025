library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$photosytnt <- renderPlot({

    I_vec=seq(from=input$Irange[1], to=input$Irange[2], by=1)
    r=25
    
    Pm1=250*((input$Ca1*as.numeric(0.7)-31)/(input$Ca1*as.numeric(0.7)+62))
    alpha1=0.6*((1-((100/input$Ca1)*((1-as.numeric(0.7))/0.3)))/(1-((100/380)*((1-as.numeric(0.7))/0.3))))
    Ac1=(Pm1/input$k)*log((alpha1*input$k*I_vec+Pm1)/(alpha1*input$k*I_vec*exp(-input$k*input$LAI1)+Pm1))-r*input$LAI1
    
    Pm1.1=250*((input$Ca1*as.numeric(1)-31)/(input$Ca1*as.numeric(1)+62))
    alpha1.1=0.6*((1-((100/input$Ca1)*((1-as.numeric(1))/0.3)))/(1-((100/380)*((1-as.numeric(1))/0.3))))
    Ac1.1=(Pm1.1/input$k)*log((alpha1.1*input$k*I_vec+Pm1.1)/(alpha1.1*input$k*I_vec*exp(-input$k*input$LAI1)+Pm1.1))-r*input$LAI1
  
    
    Pm2=250*((input$Ca2*as.numeric(0.7)-31)/(input$Ca2*as.numeric(0.7)+62))
    alpha2=0.6*((1-((100/input$Ca2)*((1-as.numeric(0.7))/0.3)))/(1-((100/380)*((1-as.numeric(0.7))/0.3))))
    Ac2=(Pm2/input$k)*log((alpha2*input$k*I_vec+Pm2)/(alpha2*input$k*I_vec*exp(-input$k*input$LAI1)+Pm2))-r*input$LAI1

    Pm2.1=250*((input$Ca2*as.numeric(1)-31)/(input$Ca2*as.numeric(1)+62))
    alpha2.1=0.6*((1-((100/input$Ca2)*((1-as.numeric(1))/0.3)))/(1-((100/380)*((1-as.numeric(1))/0.3))))
    Ac2.1=(Pm2.1/input$k)*log((alpha2.1*input$k*I_vec+Pm2.1)/(alpha2.1*input$k*I_vec*exp(-input$k*input$LAI1)+Pm2.1))-r*input$LAI1
    
    max_value=max(c(Ac1, Ac1.1, Ac2, Ac2.1))
    min_value=min(c(Ac1, Ac1.1, Ac2, Ac2.1))
    
    plot(I_vec, Ac1, type="l", xlab=expression(paste("Light intensity over canopy, μmol ", m^-2," ", s^-1)),
         ylab=expression(paste("Net photosynthesys, μg C", m^-2," ", s^-1)), ylim=c(-200,450))
    lines(I_vec, Ac1, col="darkgreen", lty=1)
    lines(I_vec, Ac2, col="darkgreen", lty=2)
    lines(I_vec, Ac1.1, col="darkorange", lty=1)
    lines(I_vec, Ac2.1, col="darkorange", lty=2)

    legend("bottomright", c(paste("CO2", input$Ca1, "(ppm),", "C3 plant"), 
                         paste("CO2", input$Ca2, "(ppm),",  "C3 plant"),
                         paste("CO2", input$Ca1, "(ppm),",  "C4 plant"), 
                         paste("CO2", input$Ca2, "(ppm),",  "C4 plant")), lty=c(1,2,1,2), col=c("darkgreen","darkgreen","darkorange","darkorange"), bty="n")
    grid()
    minor.tick()
    })
  
})


