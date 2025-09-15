library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$PET <- renderPlot({

    Temp=seq(from=input$Temp_range[1], to=input$Temp_range[2], by=0.1)
    
    #given contants
    k=0.4
    d=0.64
    zm=0.13
    zv=0.026
    Z=30
    UZ=25
    I=400
    cp=1004
    lambda=2.45*10^6
    rho=1.20
    gamma=(rho*cp)/lambda
    
    
    e_sat=5*10^5*exp(-5033/(Temp+273))
    
    #for calculating the derivative
    e_sat_expr=expression(5*10^5*exp(-5033/(Temp+273)))
    sT=eval(D(e_sat_expr, 'Temp'))
    
    ga=(k^2*UZ)/(log((Z+(zm*input$h)-(d*input$h))/(zm*input$h))*log((Z+(zv*input$h)-(d*input$h))/(zv*input$h)))
    
    gs1=0.053-0.030*(input$ca1/900)
    gc1=gs1*input$LAI
    #Penman-Monteith
    ET1=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc1)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc1)))))

    gs2=0.053-0.030*(input$ca2/900)
    gc2=gs2*input$LAI
    #Penman-Monteith
    ET2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc2)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc2)))))
    
    gs3=0.053-0.030*(input$ca3/900)
    gc3=gs3*input$LAI
    #Penman-Monteith
    ET3=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc3)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc3)))))
      

    #2nd height
    ga2=(k^2*UZ)/(log((Z+(zm*input$h2)-(d*input$h2))/(zm*input$h2))*log((Z+(zv*input$h2)-(d*input$h2))/(zv*input$h2)))
    #Penman-Monteith
    ET1.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc1)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc1)))))
    #Penman-Monteith
    ET2.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc2)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc2)))))
    #Penman-Monteith
    ET3.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc3)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc3)))))
    
    
    
        # ymax=max(c(Ac1,Ac2,Ac3))
    plot(Temp, ET1, type="l", xlim=c(min(Temp),max(Temp)), ylim=c(0,max(c(ET1,ET1.2))), xlab= expression(paste("Temperatur",e^degree,"C")),
         ylab=expression(paste("Transpiration, mm ", h^-1)), main="variable y scale")
    lines(Temp, ET1, col="pink", lty=1, lwd=2)
    lines(Temp, ET2, col="pink", lty=2, lwd=2)
    lines(Temp, ET3, col="pink", lty=3, lwd=2)
    
    lines(Temp, ET1.2, col="darkgreen", lty=1, lwd=2)
    lines(Temp, ET2.2, col="darkgreen", lty=2, lwd=2)
    lines(Temp, ET3.2, col="darkgreen", lty=3, lwd=2)
    
    legend("topleft", c(expression(paste("CO"[2]," a, height 1")), 
                        expression(paste("CO"[2]," b, height 1")),
                        expression(paste("CO"[2]," c, height 1")),
                        expression(paste("CO"[2]," a, height 2")), 
                        expression(paste("CO"[2]," b, height 2")),
                        expression(paste("CO"[2]," c, height 2"))), lwd=1, lty=c(1,2,3, 1,2,3), col=c("pink","pink","pink", "darkgreen", "darkgreen", "darkgreen"), bty="n")
    grid()
    minor.tick()
    })
  
  
  
  output$PETfix <- renderPlot({
    
    Temp=seq(from=input$Temp_range[1], to=input$Temp_range[2], by=0.1)
    
    #given contants
    k=0.4
    d=0.64
    zm=0.13
    zv=0.026
    Z=30
    UZ=25
    I=400
    cp=1004
    lambda=2.45*10^6
    rho=1.20
    gamma=(rho*cp)/lambda
    
    
    e_sat=5*10^5*exp(-5033/(Temp+273))
    
    #for calculating the derivative
    e_sat_expr=expression(5*10^5*exp(-5033/(Temp+273)))
    sT=eval(D(e_sat_expr, 'Temp'))
    
    ga=(k^2*UZ)/(log((Z+(zm*input$h)-(d*input$h))/(zm*input$h))*log((Z+(zv*input$h)-(d*input$h))/(zv*input$h)))
    
    
    
    gs1=0.053-0.030*(input$ca1/900)
    gc1=gs1*input$LAI
    #Penman-Monteith
    ET1=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc1)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc1)))))
    
    gs2=0.053-0.030*(input$ca2/900)
    gc2=gs2*input$LAI
    #Penman-Monteith
    ET2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc2)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc2)))))
    
    gs3=0.053-0.030*(input$ca3/900)
    gc3=gs3*input$LAI
    #Penman-Monteith
    ET3=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga/gc3)))))+((gamma*ga*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga/gc3)))))
    
    
    #2nd height
    ga2=(k^2*UZ)/(log((Z+(zm*input$h2)-(d*input$h2))/(zm*input$h2))*log((Z+(zv*input$h2)-(d*input$h2))/(zv*input$h2)))
    #Penman-Monteith
    ET1.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc1)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc1)))))
    #Penman-Monteith
    ET2.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc2)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc2)))))
    #Penman-Monteith
    ET3.2=3600*(((sT*I)/(lambda*(sT+gamma*(1+(ga2/gc3)))))+((gamma*ga2*e_sat*(1-(input$RH/100)))/(sT+gamma*(1+(ga2/gc3)))))
    
    
    
    # ymax=max(c(Ac1,Ac2,Ac3))
    plot(Temp, ET1, type="l", xlim=c(min(Temp),max(Temp)), xlab= expression(paste("Temperatur",e^degree,"C")),
         ylab=expression(paste("Transpiration, mm ", h^-1)), ylim=c(0, 30), main="fixed y scale")
    lines(Temp, ET1, col="pink", lty=1, lwd=2)
    lines(Temp, ET2, col="pink", lty=2, lwd=2)
    lines(Temp, ET3, col="pink", lty=3, lwd=2)
    
    lines(Temp, ET1.2, col="darkgreen", lty=1, lwd=2)
    lines(Temp, ET2.2, col="darkgreen", lty=2, lwd=2)
    lines(Temp, ET3.2, col="darkgreen", lty=3, lwd=2)
    
    legend("topleft", c(expression(paste("CO"[2]," a, height 1")), 
                        expression(paste("CO"[2]," b, height 1")),
                        expression(paste("CO"[2]," c, height 1")),
                        expression(paste("CO"[2]," a, height 2")), 
                        expression(paste("CO"[2]," b, height 2")),
                        expression(paste("CO"[2]," c, height 2"))), lwd=1, lty=c(1,2,3, 1,2,3), col=c("pink","pink","pink", "darkgreen", "darkgreen", "darkgreen"), bty="n")
    grid()
    minor.tick()
  })
  
})


