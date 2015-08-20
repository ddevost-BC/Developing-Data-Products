library(shiny,quietly=TRUE)

# Define UI 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Time Series Forecasts For Australian Gas Production"),
  
  # Sidebar with controls to select the dataset and forecast ahead duration
  sidebarPanel(
    selectInput("variable", "Variable:", list("Gas")),
                
    numericInput("ahead", "Months to Forecast Ahead:", 6),
    
    submitButton("Update View")
  ),
  

  
  # Show the caption and forecast plots
  mainPanel(
    h3(textOutput("caption")),
    
    tabsetPanel( 
      tabPanel("Arima Forecast", plotOutput("arimaForecastPlot")),
      tabPanel("Time Series", plotOutput("Plot"))
    )
  )
))
