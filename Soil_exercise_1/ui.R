library(shiny)



# Define UI for dataset viewer application
shinyUI(fluidPage(theme = "bootstrap.css",

  # Application title
  headerPanel("Exercise SOIL 1, simulation of a decaying organic mass"),

  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    numericInput("C0",
                 "C input (Initial C decaying)",
                 value=12,
                 min=0,
                 max=120),
    sliderInput("rs1",
                "Substrate initial N:C (rs) 1",
                min = 0,
                max = 1,
                value = 0.05, step=0.001),
    sliderInput("rs2",
                "Substrate initial N:C (rs) 2",
                min = 0,
                max = 1,
                value = 0.05, step=0.001),
    sliderInput("rd1",
               "Decomposers N:C (rd) 1",
                min = 0,
                max = 1,
                value = 0.1, step=0.01),
    sliderInput("rd2",
                "Decomposers N:C (rd) 2",
                min = 0,
                max = 1,
                value = 0.56, step=0.01),
    sliderInput("u",
                "Decomposers growth rate (u)",
                min = 0,
                max = 0.001,
                value = 0.0005, step=0.00001),
    sliderInput("ed",
                "Decomposers (nedbrytare) efficiency (ed)",
                min = 0,
                max = 1,
                value = 0.25, step=0.05),
    sliderInput("timerange", label = "time (days)", min = 0,
                max = 5475, value = c(0, 365*4))

  ),


  # Show a plot of the generated distribution
  mainPanel(
        # fluidRow(
        #   column(10, plotOutput("CNsim")),
        #   column(10, plotOutput("CNratio"))
        # )

        fluidRow(
          column(2, align="right",
                 plotOutput(outputId = "CNsim",  width  = "600px",height = "400px"),
                 plotOutput(outputId = "Nsim",  width  = "600px",height = "400px"),
                 plotOutput(outputId = "CNratio", width  = "600px",height = "400px"),
                 plotOutput(outputId = "CNcritic", width  = "600px",height = "400px")
          ))

  )
))
