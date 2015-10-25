library(shiny)

data <- read.csv("./Storm.csv")

dataset <-data


shinyServer(
  function(input, output) {
    ## Option to download the dataset
    output$downloadData <- downloadHandler(
      filename = function() {paste(input$dataset, '.csv', sep='')},
      content = function(file) {
        write.csv(dataset(),file)
        
        output$inputWeather_Typevalue <- renderPrint({input$Weather_Type})
        output$inputStatevalue <- renderPrint({input$State})
        output$Total_Damage <- renderPrint ({Total_Damage(input$Weather_Type,input$State)})
        output$Fatalities <- renderPrint({Fatalities(input$Weather_Type,input$State)})
        output$Injuries <- renderPrint({Injuries(input$Weather_Type, input$State)})
        output$Total_Casualties <- renderPrint({Total_Casualties(input$Weather_Type, input$State)})
        output$Property_Damage <- renderPrint({Property_Damage(input$Weather_Type, input$State)})
        output$Crop_Damage <- renderPrint({Crop_Damage(input$Weather_Type, input$State)})s
      }
    )
  

  
})
