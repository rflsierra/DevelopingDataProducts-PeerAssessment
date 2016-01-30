library(shiny)
library(lattice)

server <- function(input, output) {
    
    currentsample <- reactive({
        ceiling((input$universe * as.numeric(input$confidence) * as.numeric(input$confidence) * 0.5 * 0.5) / (((input$universe - 1) * (input$error / 100) * (input$error / 100)) + (as.numeric(input$confidence) * as.numeric(input$confidence) * 0.5 * 0.5)))
    })
    
    currentsd <- reactive({
        (input$error / 100) * sqrt(currentsample())
    })
    
    output$samplecalc <- reactive(currentsample())
    
    output$sample <- renderPlot({
        histogram(rnorm(n = currentsample(), sd = currentsd()), col = "gray", alpha = 0.3,
                  main = "Determined sample's distribution and standard deviations", xlim = c(-5,5),
                  xlab = "Position of sample cases", ylab = "Frequency",
                  panel = function(...) {
                      panel.abline(v = currentsd(), lty = "dotted", col = "yellow")
                      panel.abline(v = -currentsd(), lty = "dotted", col = "yellow")
                      panel.abline(v = 2*currentsd(), lty = "dotted", col = "orange")
                      panel.abline(v = -2*currentsd(), lty = "dotted", col = "orange")
                      panel.abline(v = 3*currentsd(), lty = "dotted", col = "red")
                      panel.abline(v = -3*currentsd(), lty = "dotted", col = "red")
                      panel.histogram(...) 
                  }
        )
    })
    
    output$breakeven <- renderPlot({
        plot(x = seq_len(40000), y = seq_len(40000) * as.numeric(input$cost), type = "l", main = "Investment: Break-even point",
             xlab = "Number of cases in sample", ylab = "Cost of samples in poll")
        abline(v = currentsample())
        text(x = currentsample(), y = 0, "Sample size required")
        abline(h = input$budget)
        text(x = 7000, y = input$budget, "Budget available")
    })
    
    
}
