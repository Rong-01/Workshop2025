library(shiny) 

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css",

  # Application title
  headerPanel("Exercise 2, light extinction"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view 
  sidebarPanel(

    sliderInput("k1",
               "Extinction rate 1:",
                min = 0,
                max = 0.5,
                value = 0.01, step=0.01),
    sliderInput("k2",
                "Extinction rate 2:",
                min = 0,
                max = 0.5,
                value = 0.05, step=0.01),
    sliderInput("k3",
                "Extinction rate 3:",
                min = 0,
                max = 0.8,
                value = 0.1, step=0.01),
    sliderInput("I_0",
                "Input:",
                min = 0,
                max = 3000,
                value = 1500),
    sliderInput("LAIrange", label = "LAI Range", min = 0,
                max = 30, value = c(0, 10))

  ),


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("lightextinction", width  = "600px",height = "400px")
  )
))
