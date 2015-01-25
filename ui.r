library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Comparison of Exponential Distribution and Central Limit Theorem"),
    sidebarPanel(
      h4('Displays a histogram of distribution of 40 exponentials for n simulations'),
     
      radioButtons("n", label="Number of Simulations:",
                   choices=list("10" = "10",
                                "100" = "100",
                                "500" = "500",
                                "1000"= "1000"),selected="100")
      
       		       ),
    mainPanel(
      h4("Histogram plot of the means of the n simulations of rexp(n, lambda)"),
      plotOutput("sampleMeanDiag")
    )
  ))