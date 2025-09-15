# app.R for exercise 4

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

library(rsconnect) #comment out after deploy the app, as it cause runtime error in publish it on cloud 

rsconnect::deployApp("Exercise_4")

# run the following two lines in the console to generate the dependency file in the same directory of main applicaiton
# setwd("Exercise_4")
# rsconnect::writeManifest() # if it shows unable to change then use the following line with explicit path
# rsconnect::writeManifest(appDir = "C:/MyTemp/Workshop_exercise2025/Workshop2025/Exercise_4")