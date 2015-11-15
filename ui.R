library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Impact of Severe Weather on Public Health and Economy in USA"),
  
  #Set sidebar
  sidebarLayout(
    sidebarPanel(
      selectInput("impact", 
                  "Select impact type:", 
                  choices =c("Fatalities","Injuries","Total casualties","Property damage","Crop damage","Total damage")),
      
      br(),
      sliderInput("year", 
                  label = "Select the range of years to display:",
                  min = 1950, 
                  max = 2012, 
                  value = c(1950,2012), 
                  format = "0000"),         
      
     br(),
     radioButtons("color", "Select the colour of chart", choices=c("Green", "Blue", "Yellow"), selected = "Blue"),
    
     br(),
     p("Data for the following impact types is available from 1993: Property damage, Crop damage, Total damage.")
    ),
  
  # set main panel
  mainPanel(
    
    plotOutput("plot"), 
    verbatimTextOutput("summary")

  )
  )))
