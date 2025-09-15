library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css", #themes from https://bootswatch.com/

  # Application title
  headerPanel("Exercise 3, net photosynthesis in the canopy and N content"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(

    sliderInput("Cn1",
               "N in leaves (1), mg/g",
                min = 10,
                max = 50,
                value = 30, step=1),
    sliderInput("Cn2",
                "N in leaves (2), mg/g",
                min = 10,
                max = 50,
                value = 45, step=1),
    sliderInput("Cn3",
                "N in leaves (3), mg/g",
                min = 10,
                max = 50,
                value = 15, step=1),
    sliderInput("LAI",
                "LAI",
                min = 0,
                max = 10,
                value = 5, step=1),
    sliderInput("alpha",
                HTML("Quantum yields (&alpha;)"),
                min = 0.06,
                max = 3,
                value = 0.5, step=0.01),
    sliderInput("k",
                "Light extinction coefficient",
                min = 0.3,
                max = 0.7,
                value = 0.5, step=0.01),
    sliderInput("Irange", 
                label = "Light intensity over canopy, μmol m-2s-1",
                min = 0,
                max = 10000, value = c(0, 2000))

  ),


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("photosytnt", width  = "600px",height = "400px")
  )
))
