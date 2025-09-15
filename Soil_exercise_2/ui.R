library(shiny)



# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css",
                  
  # Application title
  headerPanel("Exercise SOIL 2: nutrients in an ecosystem with constant influx of organic matter"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    sliderInput("I",
                "Organic matter input flux to the system (I)",
                min = 0,
                max = 15,
                value = 0.8, step=0.1),
    sliderInput("rd",
               "Decomposer N:C (rd)",
                min = 0,
                max = 1,
                value = 0.1, step=0.01),
    sliderInput("rs",
                "Input N:C (rs)",
                min = 0,
                max = 1,
                value = 0.01, step=0.01),
    sliderInput("u",
                "Decomposer reproduction rate (u)",
                min = 0,
                max = 0.001,
                value = 0.0005, step=0.00001),
    sliderInput("ed",
                "Decomposer efficiency (ed):",
                min = 0,
                max = 1,
                value = 0.25, step=0.05),
    sliderInput("timerange", label = "time (days)", min = 0,
                max = 10000, value = c(0, 5000))

  ),


  # Show a plot of the generated distribution
  mainPanel(
        # fluidRow(
        #   column(10, plotOutput("CNsim")),
        #   column(10, plotOutput("CNratio"))
        # )

        
         plotOutput(outputId = "sim", width  = "90%",height = "800px")
                 

  )
))
