library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$sim <- renderPlot({

    time_sim=seq(from=input$timerange[1], to=input$timerange[2])

    #caclulating k
    k=((1-input$ed)/input$ed)*input$u

    #dynamic functions
    C=input$I/k*(1-exp(-k*time_sim))
    N=(input$I/k)*input$rd*(1-exp(-k*time_sim))-
      ((input$I*input$ed)/input$u)*(input$rd-input$rs)*(1-exp(-(input$u/input$ed)*time_sim))

    #steady state functions
    Css=input$I/k
    Nss=input$rd*Css-(input$rd-input$rs)*Css*(1-input$ed)
    
    #plotting C and N
    par(mar=c(5,5,2,5))
    layout(matrix(c(1,1,1,1,1,1,2,2), 4, 2, byrow = TRUE))
    
    plot(time_sim, C, type="l", ylab=expression(paste("C (t ", ha^-1, ")")), xlab="days", col="red", lwd=2, ylim=c(0, Css*1.15),  cex.lab=2, cex.axis=2, cex.main=2, cex.sub=2)
    abline(h=Css, lwd=2, lty=2, col="red")
    par(new = T)
    plot(time_sim, N, type="l", axes=F, xlab=NA, ylab=NA, col="violet", lwd=2, ylim=c(0, Css*0.15),  cex.lab=2, cex.axis=2, cex.main=2, cex.sub=2)
    abline(h=Nss, lty=2, lwd=3, col="violet")
    axis(side = 4, cex.axis = 2)
    mtext(side = 4, line = 3, expression(paste("N (t ", ha^-1, ") (scale is a fixed ratio of C scale)")), cex=1.5)
    legend("bottomright", c("C", "N"), col=c("red","violet"), lwd=2, bty="n", cex=2)
    legend("topright", c("C steady state", "N steady state"), col=c("red","violet"), lwd=2, bty="n", lty=c(2,3), cex=2)
    grid()
    minor.tick()
    
    
    barplot(k,  horiz=TRUE, col="orange", main="k value", xlim=c(0,0.02), cex.lab=2, cex.axis=2, cex.main=2, cex.sub=2, xlab = "(k is calculated from ed and u)")

    
    })

})


