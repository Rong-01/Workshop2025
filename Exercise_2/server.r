library(shiny)

shinyServer(function(input, output) {


  output$lightextinction <- renderPlot({

    LAI_vec=seq(from=input$LAIrange[1], to=input$LAIrange[2], by=0.01)
    light1=input$I_0*exp(-input$k1*LAI_vec)
    light2=input$I_0*exp(-input$k2*LAI_vec)
    light3=input$I_0*exp(-input$k3*LAI_vec)

    plot(LAI_vec, light1, type="l", col="firebrick1", lwd=2, ylim=range(c(light1, light2, light3)), xlab="LAI",
         ylab=expression(paste("Light exctinction (",mu,"mol ",m^-2, s^-1,")", sep = "")))
    lines(LAI_vec,light1, col="firebrick1", lwd=2)
    lines(LAI_vec,light2, col="darkgreen", lwd=2)
    lines(LAI_vec,light3, col="violet", lwd=2)
    legend("topright", c("Extinction rate 1", "Extinction rate 2", "Extinction rate 3"), lty=1, col=c("firebrick","darkgreen","violet"), bty="n")

    })
})


