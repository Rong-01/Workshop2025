library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$CNsim <- renderPlot({

    time_sim=seq(from=input$timerange[1], to=input$timerange[2])

    #C function
    C=input$C0*exp(-((1-input$ed)/input$ed)*input$u*time_sim)

    #plotting C and N
    par(mar=c(5,5,2,5))
    plot(time_sim, C, type="l", ylab=expression(paste("C (t ", ha^-1, ")")), xlab="days", col="black", lwd=2, ylim=c(0,max(C)*1.3))
    grid()
    minor.tick()
    })

  output$Nsim <- renderPlot({
    
    time_sim=seq(from=input$timerange[1], to=input$timerange[2])
    
    #C function
    C=input$C0*exp(-((1-input$ed)/input$ed)*input$u*time_sim)
    #C/N ratio
    r1=input$rd1+(input$rs1-input$rd1)*exp(-input$u*time_sim)
    r2=input$rd2+(input$rs2-input$rd2)*exp(-input$u*time_sim)
    #N function
    N1=r1*C
    N2=r2*C
    
    #plotting C and N
    par(mar=c(5,5,2,5))
    plot(time_sim, N1, type="l", col="red", lwd=2, lty=1, ylim=c(0,max(c(N1, N2))*1.3), ylab=expression(paste("N (t ", ha^-1, ")")), xlab="days",)
    lines(time_sim, N2,  col="green", lwd=2, lty=2)
    legend("topright", c("Substrate initial N:C 1", "Substrate initial N:C 2"), col=c("red","green"), lwd=2, bty="n", lty=c(1,2))
    grid()
    minor.tick()
  })
  
  output$CNratio <- renderPlot({

    #recalculate the needed values (they are specific to each renderPlot environment)
    time_sim=seq(from=input$timerange[1], to=input$timerange[2])
    #C function
    C=input$C0*exp(-((1-input$ed)/input$ed)*input$u*time_sim)
    #C/N ratio
    r1=input$rd1+(input$rs1-input$rd1)*exp(-input$u*time_sim)
    r2=input$rd2+(input$rs2-input$rd2)*exp(-input$u*time_sim)
    #N function
    N1=r1*C
    N2=r2*C

    par(mar=c(5,5,2,5))
    plot(time_sim, r1, type="l", ylab="N:C of the system", xlab="days", lwd=2, lty=1, col="red", ylim=c(min(c(r1, r2)),max(c(r1, r2))))
    lines(time_sim, r2,  col="green", lwd=2, lty=2)
    grid()
    minor.tick()
  })

  
  output$CNcritic <- renderPlot({
    
    #recalculate the needed values (they are specific to each renderPlot environment)
    time_sim=seq(from=input$timerange[1], to=input$timerange[2])
    #C function
    C=input$C0*exp(-((1-input$ed)/input$ed)*input$u*time_sim)
    #C/N ratio
    r1=input$rd1+(input$rs1-input$rd1)*exp(-input$u*time_sim)
    r2=input$rd2+(input$rs2-input$rd2)*exp(-input$u*time_sim)
    #N function
    N1=r1*C
    N2=r2*C
    rc1=input$ed*input$rd1    
    rc2=input$ed*input$rd2
    
    par(mar=c(15,5,2,5))
    barplot_mat<-cbind(c(input$rd1, input$rs1, rc1), c(input$rd2, input$rs2, rc2))
    barplot((barplot_mat), beside=T, ylim=c(0, max(barplot_mat)*1.2), names.arg = c("N:C Decomposers 1", 
                                                    "N:C Substr. 1", 
                                                    "N:C Critical 1",
                                                    "N:C Decomposers 2", 
                                                    "N:C Substr. 2", 
                                                    "N:C Critical 2"), 
                                                  col=c("darkgreen", 
                                                   "darkorange",
                                                   "violet"), density=35, angle=c(45,45,45,125, 125, 125), las=2)
    box()

  })
  
  
})


