library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Histogram & Densityplots"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1,
                max = 1000000, 
                value = 10),
    sliderInput("bins", 
                "Number of bins:", 
                min = 1,
                max = 1000, 
                value = 100),
    sliderInput("degfr",
                "Degrees of Freedom",
                min = 3,
                max = 1000, 
                value = 3)
  ),

  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot"),
    plotOutput("densPlot")
  )
))
