# app.R for soil exercise 2

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

library(rsconnect) #comment out after deploy the app, as it cause runtime error in publish it on cloud in free version

rsconnect::deployApp("Soil_exercise_2")

# run the following two lines in the console to generate the dependency file in the same directory of main applicaiton
# setwd("Soil_exercise_2")
# rsconnect::writeManifest() # if it shows unable to change then use the following line with explicit path
# rsconnect::writeManifest(appDir = "C:/MyTemp/Workshop_exercise2025/Workshop2025/Soil_exercise_2")