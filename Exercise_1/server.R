library(shiny)
library(Hmisc)

shinyServer(function(input, output) {


  output$lightextinction <- renderPlot({

    I_vec=seq(from=input$Irange[1], to=input$Irange[2], by=0.01)
    ag1=((input$alpha*I_vec+input$Pm1-sqrt((input$alpha*I_vec+input$Pm1)^2-4*input$theta*input$alpha*I_vec*input$Pm1))/(2*input$theta))-input$Rd
    ag2=((input$alpha*I_vec+input$Pm2-sqrt((input$alpha*I_vec+input$Pm2)^2-4*input$theta*input$alpha*I_vec*input$Pm2))/(2*input$theta))-input$Rd
    ag3=((input$alpha*I_vec+input$Pm3-sqrt((input$alpha*I_vec+input$Pm3)^2-4*input$theta*input$alpha*I_vec*input$Pm3))/(2*input$theta))-input$Rd
    
    plot(I_vec, ag1, type="l", col="firebrick1", lwd=2, ylim=range(c(ag1, ag2, ag3)), xlab=expression(paste("Light intensity over canopy, μmol ", m^-2," ", s^-1)),
         ylab=expression(paste("Net photosynthesys, μg C", m^-2," ", s^-1)))
    lines(I_vec,ag1, col="firebrick1", lwd=2, lty=1)
    lines(I_vec,ag2, col="darkgreen", lwd=2, lty=2)
    lines(I_vec,ag3, col="violet", lwd=2, lty=3)
    abline(h=0)
    legend("topright", c("Pm1", "Pm2", "Pm3"), col=c("firebrick","darkgreen","violet"), lty=c(1,2,3), bty="n")
    grid()
    minor.tick()
    })
  
  
  output$lightextinction2 <- renderPlot({
    
    I_vec=seq(from=input$Irange[1], to=input$Irange[2], by=0.01)
    ag1=((input$alpha*I_vec+input$Pm1-sqrt((input$alpha*I_vec+input$Pm1)^2-4*input$theta*input$alpha*I_vec*input$Pm1))/(2*input$theta))-input$Rd
    ag2=((input$alpha*I_vec+input$Pm2-sqrt((input$alpha*I_vec+input$Pm2)^2-4*input$theta*input$alpha*I_vec*input$Pm2))/(2*input$theta))-input$Rd
    ag3=((input$alpha*I_vec+input$Pm3-sqrt((input$alpha*I_vec+input$Pm3)^2-4*input$theta*input$alpha*I_vec*input$Pm3))/(2*input$theta))-input$Rd
    
    plot(I_vec, ag1+input$Rd, type="l", col="firebrick1", lwd=2, ylim=range(c(ag1, ag2, ag3)), xlab=expression(paste("Light intensity over canopy, μmol ", m^-2," ", s^-1)),
         ylab=expression(paste("Gross photosynthesys, μg C", m^-2," ", s^-1)))
    lines(I_vec,ag1+input$Rd, col="firebrick1", lwd=2, lty=1)
    lines(I_vec,ag2+input$Rd, col="darkgreen", lwd=2, lty=2)
    lines(I_vec,ag3+input$Rd, col="violet", lwd=2, lty=3)
    abline(h=input$Rd, lty=1, col="darkgrey")
    abline(h=0)
    
    legend("topright", c("Pm1", "Pm2", "Pm3", "Rd"), col=c("firebrick","darkgreen","violet", "darkgrey"), lty=c(1,2,3,1), bty="n")
    grid()
    minor.tick()
  })
  
})


