library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css", #themes from https://bootswatch.com/

  # Application title
  headerPanel("Exercise 1, light response curve of a C3 plant leaf"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(

    sliderInput("Pm1",
                "Light saturated photosyntethic rate (Pm1) μg C m-2 s-1",
                min = 0,
                max = 500,
                value = 250, step=1),
    sliderInput("Pm2",
                "Light saturated photosyntethic rate (Pm2)  μg C m-2 s-1",
                min = 0,
                max = 500,
                value = 120, step=1),
    sliderInput("Pm3",
                "Light saturated photosyntethic rate (Pm3)  μg C m-2 s-1",
                min = 0,
                max = 500,
                value = 455, step=1),
    sliderInput("Rd",
                "Dark respiration rate (Rd)  μg C m-2 s-1",
                min = 0,
                max = 120,
                value = 25, step=1),
    sliderInput("alpha",
                HTML("Quantum yields (&alpha;)"),
                min = 0,
                max = 1,
                value = 0.5, step=0.01),
    sliderInput("theta",
                HTML("Shape parameters (&theta;)"),
                min = 0,
                max = 1,
                value = 0.75, step=0.01),
    sliderInput("Irange", label = "Light intensity over canopy, μmol m-2s-1", min = 0,
                max = 10000, value = c(0, 2000))

  ),


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("lightextinction", width  = "600px",height = "400px"),
    plotOutput("lightextinction2", width  = "600px",height = "400px")
    
  )
))
