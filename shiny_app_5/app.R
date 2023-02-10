library(shiny)
library(shinythemes)
library(htmltools)
ui<-fluidPage(
  navbarPage("BMI calculator",
  
  tabPanel("Home", sidebarPanel(HTML("<h3>Input parameters</h3>"),
                                sliderInput("height",
                                            label = "Height",
                                            value = 50,
                                            min=30,
                                            max=100),
                                sliderInput("weight",
                                            label = "Weight",
                                            value = 90,
                                            min=30,
                                            max=100),
                                actionButton("submitbutton",
                                             "Submit",
                                             class = "btn btn-primary")
                                ),
                  mainPanel(HTML("<h3>Status/Output</h3>"),
                            verbatimTextOutput("contents"),
                            tableOutput("tabledata")
                  )
  ), 
  tabPanel("About", titlePanel("About"), div(includeMarkdown("about.md"), align="justify"))
                    
  
)
)

server<- function(input, output, server){
  datasetInput<-reactive({
    bmi<-input$weight/((input$height/100)*(input$height/100))
    bmi<-data.frame(bmi)
    names(bmi) <-"BMI"
    print(bmi)
  })
  
  output$contents<-renderPrint({
    if(input$submitbutton>0){
      isolate("calculation complete")
      }else{(return("server is ready for calculation"))
      }
    })
  output$tabledata<-renderTable({
    if(input$submitbutton){
      isolate(datasetInput())
    }
  }
  )
}

shinyApp(ui, server)