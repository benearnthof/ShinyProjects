library(shiny)
library(sm)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate an rnorm distribution and plot it
    dist <- rnorm(input$obs)
    hist(dist, breaks = input$bins, xlim = c(-4,4))
  })
  output$densPlot <- renderPlot({
    req({input$degfr})
    norm <- density(rnorm(input$obs)) # returns the density data
    expo <- density(rexp(input$obs))
    stud <- density(rt(input$obs, input$degfr))
    plot(norm, ylim = c(0, 1), xlim = c(-4,4), col = "blue")
    lines(expo, col = "orange")
    lines(stud, col = "green")
  })
})
