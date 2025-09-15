library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$photosytnt <- renderPlot({

    I_vec=seq(from=input$Irange[1], to=input$Irange[2], by=1)

    r1=25*(input$Cn1/20)
    Pm1=250*((1+4.5*input$Cn1)/91)
    Ac1=(Pm1/input$k)*log((input$alpha*input$k*I_vec*Pm1)/(input$alpha*input$k*I_vec*exp(-input$k*input$LAI)+Pm1))-r1*input$LAI
    
    r2=25*(input$Cn2/20)
    Pm2=250*((1+4.5*input$Cn2)/91)
    Ac2=(Pm2/input$k)*log((input$alpha*input$k*I_vec*Pm2)/(input$alpha*input$k*I_vec*exp(-input$k*input$LAI)+Pm2))-r2*input$LAI
    
    r3=25*(input$Cn3/20)
    Pm3=250*((1+4.5*input$Cn3)/91)
    Ac3=(Pm3/input$k)*log((input$alpha*input$k*I_vec*Pm3)/(input$alpha*input$k*I_vec*exp(-input$k*input$LAI)+Pm3))-r3*input$LAI
    
    
    #ymax=max(c(Ac1,Ac2,Ac3))
    ymax=6000
    #ymin=min(c(Ac1,Ac2,Ac3))
    plot(I_vec, Ac1, type="l", ylim=c(0,ymax), xlab=expression(paste("Light intensity over canopy, μmol ", m^-2," ", s^-1)),
         ylab=expression(paste("Net photosynthesis, μg C", m^-2," ", s^-1)))
    lines(I_vec, Ac1, col="darkorange", lty=1, lwd=2)
    lines(I_vec, Ac2, col="darkgreen", lty=2, lwd=2)
    lines(I_vec, Ac3, col="darkorchid", lty=3, lwd=2)
    
    legend("bottomright", c("N content (1)", "N content (2)", "N content (3)"), col=c("darkorange","darkgreen","darkorchid"), bty="n", lty=c(1,2,3), lwd=2)
    grid()
    minor.tick()
    })
})


