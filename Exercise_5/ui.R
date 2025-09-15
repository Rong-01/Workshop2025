library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css", #themes from https://bootswatch.com/

  # Application title
  headerPanel("Exercise 5, evapotranspiration as function of CO2 concentration, vegetation and humidity"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(

    sliderInput("RH",
                "Relative humidity (%)",
                min = 0,
                max = 100,
                value = 50, step=1),
    sliderInput("ca1",
               "CO2 concentration 1, ppm",
                min = 350,
                max = 700,
                value = 350, step=1),
    sliderInput("ca2",
                "CO2 concentration 2, ppm",
                min = 350,
                max = 700,
                value = 500, step=1),
    sliderInput("ca3",
                "CO2 concentration3 , ppm",
                min = 350,
                max = 700,
                value = 700, step=1),
    sliderInput("LAI",
                "LAI",
                min = 0,
                max = 30,
                value = 3, step=1),
    sliderInput("h",
                 "height of the vegetation 1 (m)",
                 min = 0,
                 max = 30,
                 value = 0.5, step=0.1),
    sliderInput("h2",
                "height of the vegetation 2 (m)",
                min = 0,
                max = 30,
                value = 9, step=0.1),
    sliderInput("Temp_range", 
                label = "Temperature range (ºC)",
                min = -30,
                max = 60, value = c(0, 30), step=0.1)

  ),


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("PET", width  = "600px",height = "400px"),
    plotOutput("PETfix", width  = "600px",height = "400px")
    
  )
))
