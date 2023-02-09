ui <- fluidPage(theme = shinytheme("united"),
               
               # Page header
               headerPanel('Play Golf?'),
               
               # Input values
               sidebarPanel(
                 HTML("<h3>Input parameters</h3>"),
                 
                 selectInput("outlook", label = "Outlook:", 
                             choices = list("Sunny" = "sunny", "Overcast" = "overcast", "Rainy" = "rainy"), 
                             selected = "Rainy"),
                 sliderInput("temperature", "Temperature:",
                             min = 64, max = 86,
                             value = 70),
                 sliderInput("humidity", "Humidity:",
                             min = 65, max = 96,
                             value = 90),
                 selectInput("windy", label = "Windy:", 
                             choices = list("Yes" = "TRUE", "No" = "FALSE"), 
                             selected = "TRUE"),
                 
                 actionButton("submitbutton", "Submit", class = "btn btn-primary")
               ),
               
               mainPanel(
                 tags$label(h3('Status/Output')), # Status/Output Text Box
                 verbatimTextOutput('contents'),
                 tableOutput('tabledata') # Prediction results table
                 
               )
)
