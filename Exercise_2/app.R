# app.R for exercise 2

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

library(rsconnect) #comment out after deploy the app, as it cause runtime error in publish it on cloud 

rsconnect::deployApp("Exercise_2")

