## load libraries
library(shiny,quietly=TRUE)
library(forecast,quietly=TRUE)
library(RMySQL,quietly=TRUE)

## create connection to database
data(gas)

gas <- ts(gas)


shinyServer(function(input, output) {
  
  getDataset <- reactive({
    if (input$variable=="Gas")
    {
      return(gas)
  }
  })
  
  output$caption <- renderText({
    paste("Dataset: ", input$variable)
  })
  
  output$arimaForecastPlot <- renderPlot({
    fit <- auto.arima(getDataset())
    plot(forecast(fit, h=input$ahead))
  })
  
  output$Plot <- renderPlot({
	plot(getDataset())
  })
  
})
