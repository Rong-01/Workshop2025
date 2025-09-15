# app.R for exercise 1

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

library(rsconnect) #comment out after deploy the app, as it cause runtime error in publish it on cloud 

rsconnect::deployApp("Exercise_1")

# run the following two lines in the console to generate the dependency file in the same directory of main applicaiton
# setwd("Exercise_1")
# rsconnect::writeManifest()
  