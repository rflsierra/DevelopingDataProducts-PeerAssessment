library(shiny)

ui <- navbarPage(
    "Developing Data Products' Project",
    
    tabPanel("Instructions",
             fluidRow(),
             tags$h2("What this app does:"),
             tags$p("This app calculates the required amount of sample cases to be applied in a poll in order to be able to fill three requirements that are defined by the user: max error allowed, level of confidence and the size of the Universe (the proportion has been set as a fixed value in 50%)."),
             tags$p("The user may also have the opportunity to study the costs of the poll required with the number of sample cases determined, and compare it to the available budget in each case."),
             tags$p("There are two outputs:"), 
             tags$p("1. A normal distribution simulating the expected behaviour of the sample size determined, showing the standar deviations that apply for each set of inputs."),
             tags$p("2. A x-y plot showing the costs associated with the number of cases to be applied and the cost per case accompanied by two lines showing the required sample size and total budget available, to understand the economical feasibility of the proposed sample size given the requirements of the user."),
             
             fluidRow(),
             tags$h2("How to use this app:"),
             tags$p("1. Choose values for the margin of error (min = 0.5%, max = 10.0%), for the confidence level (just 3 options, 90%, 95% and 99%), and the size of the Universe (min = 10000, max = 100000)."),
             tags$p("2. Choose values for the cost of each interview in the poll (from 10 to 100 USD) and the complete budget (from 500 to 1000000 USD)."),
             tags$p("3. Review the results in the two plots provided."),
             tags$p("4. Determine the gaps from the ideal situation for the user."),
             tags$p("5. Adjust the inputs and retry until satisfied with the result."),
             
             fluidRow(),
             tags$h2("Github Repository:"),
             tags$p("https://github.com/rflsierra/DevelopingDataProducts-PeerAssessment")
             
             
    ),
    
    tabPanel("Determine a poll's sample size", 
             
             tags$h3("Sample's statistical requirements"),
             
             fluidRow(
                 column(4, sliderInput(inputId = "error", label = "Desired error (%)", min = 0.5, max = 10.0, step = 0.1, value = 0.5)),
                 column(4, selectInput(inputId = "confidence", label = "Confidence level (%)", choices = c("90%" = 1.645, "95%" = 1.96, "99%" = 2.575))),
                 column(4, sliderInput(inputId = "universe", label = "Universe", min = 10000, max = 100000, step = 100, value = 10000))
             ),
             
             fluidRow(),
             tags$h3("Sample's budgetary requirements"),
             
             fluidRow(
                 column(4, numericInput(inputId = "cost", label = "Cost per interview (USD)", min = 10, max = 100, step = 5, value = 10)),
                 column(4, numericInput(inputId = "budget", label = "Total available budget (USD)", min = 500, max = 1000000, step = 500, value = 70000))
             ),
             
             fluidRow(),
             tags$h4("Determined sample size"),
             textOutput(outputId = "samplecalc"),
             
             fluidRow(
                 column(7, plotOutput(outputId = "sample")),
                 column(5, plotOutput(outputId = "breakeven"))
             )
    )
    
)