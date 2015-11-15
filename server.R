library(shiny)

  data <- read.csv("Storm.csv", header = TRUE)
  #Rename the column names as discribed in ui.R
  colnames(data)[2] <- "Fatalities"
  colnames(data)[3] <- "Injuries"
  colnames(data)[4] <- "Total casualties"
  colnames(data)[5] <- "Property damage"
  colnames(data)[6] <- "Crop damage"
  colnames(data)[7] <- "Total damage"
  

shinyServer(function(input, output) {

  ## define dataset from input in Ui.R
  dataset <- reactive({
    subset(data, select = c(input$impact), 
               subset = (Year >= input$year[1]& Year<=input$year[2]))
  })
  
  ## evaluate input for output
    output$plot <- renderPlot({

      barplot(dataset()[,c(input$impact)],
              main = paste(input$impact, "in", input$year[1], "-",input$year[2]),
              ylab="the number of casualties/the value of damage (US$)",
              xlab = "Year", 
              col = input$color)
  })
    
    output$summary <- renderPrint ({
      ds <- dataset()
      summary(ds)
    })
    
})
  

  
})
