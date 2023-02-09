server <- function(input, output, session) {
  
  #Input Data
  datasetInput <- reactive({
    df <- data.frame(
      Name = c("outlook", 
               "temperature",
               "humidity",
               "windy"),
      Value = as.character(c(input$outlook,
                             input$temperature,
                             input$humidity,
                             input$windy)),
      stringsAsFactors = FALSE
    )
    
    #create test datset
    play <-"play"
    df<- rbind(df, play)
    input<-transpose(df)
    write.table(input, "input.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
    test<-read.csv(paste("input", ".csv", sep=""), header = TRUE)
    test$outlook <- factor(test$outlook, levels = c("overcast", "rainy", "sunny"))
    
    Output<-data.frame(Prediction=predict(model,test), round(predict(model,test,type="prob"), 3))
    print(Output)
  })
  
  # Status/Output Text Box
  
  output$contents<-renderPrint({
    if(input$submitbutton>0){
      isolate("Calculation complete. ")
    }else{
      return("server is ready for calculation. ")
    }
  })
  
  output$tabledata <- renderTable({
    if(input$submitbutton>0){
      isolate(datasetInput())
    }
    
  })
  
}