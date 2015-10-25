library(shiny)

data <- read.csv("./Storm.csv")

dataset <-data

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Impact of Severe Weather on Public Health and Economy in USA"), 
  
  sidebarLayout(
    sidebarPanel(
      selectInput('Weather_Type', 'Weather_Type', names (dataset), selected = "TORNADO"), 
      selectInput('State', 'State', names (dataset), selected = "AL"),
      downloadButton('downloadData', 'Download dataset')
    )
  )
    ),

    mainPanel(
      h4('Instruction'),
      
      p('Storms and other severe weather events can cause both public health and economic problems.'),
      p('This application provides the number of fatalities, injuries and casualties
        and the total cost fordamage to properties and crops caused by weather across the USA
        from 1950 to 2011.'),
      p('select'),
      code("Weather_Type"),
      p('and'),
      code("State"),
      p('in the sidebar.'),
      
      h4 ('Your input'),
      p('Weather Type:'), verbatimTextOutput("inputWeather_Typevalue"),
      p('State:'), verbatimTextOutput("inputStatevalue"),
      h4 ('Total Number of Fatalities'),
      verbatimTextOutput("Fatalities"),
      h4 ('Total Number of Injuries'),
      verbatimTextOutput("Injuries"),
      h4 ('Total Number of casualties'),
      verbatimTextOutput("Total_Casualties"),
      h4 ('Total cost of damages to properties ($US)'),
      verbatimTextOutput("Property_Damage"),
      h4 ('Total cost of damages to crop ($US)'),
      verbatimTextOutput("Crop_Damage"),
      h4 ('Total cost of damages to economy ($US)'),
      verbatimTextOutput("Total_Damage")
      
    )
  )
