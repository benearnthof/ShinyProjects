library(shiny)
library(shinythemes)
library(purrr)
# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("cosmo"),
  
  # Application title
  titlePanel("DiceR: Simulate n-Sided Dice like God intended."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      numericInput("seed", label = "Random Seed?", min = 0, max = 1e15, step = 1, value = NA),
      sliderInput("numba", label = "Number of throws:", min = 1, max = 21, step = 1, value = 1),
      radioButtons("type", "Type of Dice:", choices = c("W4" = 4,
                                                        "W6" = 6,
                                                        "W8" = 8,
                                                        "W12" = 12,
                                                        "W20" = 20,
                                                        "W100" = 100)),
      actionButton("refresh", label = "Refresh!", icon = icon("recycle"))
    ),
    
    mainPanel(
      h4("Results:"),
      verbatimTextOutput("numba")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  dat <- eventReactive(input$refresh, {
    if (!is.na(input$seed)) {
      set.seed(input$seed)
      x <- purrr::rdunif(n = input$numba, a = 1, b = as.integer(input$type))
    } else {
      x <- purrr::rdunif(n = input$numba, a = 1, b = as.integer(input$type))
    }
    list(throw = x)
  })
  
  output$numba <- renderPrint({
    dat()$throw
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
