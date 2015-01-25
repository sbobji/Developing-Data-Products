
library(ggplot2)

fx <- function(x) {
  
  return (sampleMeans)
}


shinyServer(
  function(input, output) {
    output$sampleMeanDiag <- renderPlot({
      lambda <- 0.2
      n <- 40
      sim <- c(1:input$n)
      set.seed(12345)
      sampleMeans <- data.frame(x = sapply(sim, function(x) {mean(rexp(n, lambda))}))
      sampleMean <- mean(sampleMeans$x)
      theoreticalMean <- 1/lambda
      variance <- sd(sampleMeans$x)
      ggplot(data = sampleMeans, aes(x = x)) + 
        geom_histogram(aes(y=..density..), fill = I('green'), 
                       binwidth = 0.20, color = I('black')) +
        stat_function(fun = dnorm, arg = list(mean = theoreticalMean, sd = variance))
    })
  }
)