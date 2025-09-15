library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css", #themes from https://bootswatch.com/

  # Application title
  headerPanel("Exercise 4, net photosynthesis in the canopy and CO2 concentration"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(

    sliderInput("Ca1",
               "CO2 concentration 1 (ppm)",
                min = 150,
                max = 1000,
                value = 350, step=1),
    sliderInput("Ca2",
                "CO2 concentration 2 (ppm)",
                min = 150,
                max = 1000,
                value = 400, step=1),
    # sliderInput("Ca3",
    #             "CO2 concentration 3 (ppm)",
    #             min = 150,
    #             max = 600,
    #             value = 450, step=1),
    sliderInput("LAI1",
                "LAI",
                min = 0,
                max = 10,
                value = 5, step=0.25),
    sliderInput("k",
                "Light extinction coefficient",
                min = 0.3,
                max = 0.7,
                value = 0.5, step=0.01),
    sliderInput("Irange", 
                label = "Light intensity over canopy (μmol m-2 s-1)",
                min = 0,
                max = 10000, value = c(0, 2000))

  ),


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("photosytnt", width  = "600px",height = "500px")
  )
))
