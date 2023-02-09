library(shiny)
library(shinythemes)
library(data.table)
library(RCurl)
library(randomForest)

weather <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/weather-weka.csv"))
model <- randomForest(play ~ ., data = weather, ntree = 500, mtry= 4, importance = TRUE)

#weather <- read.csv(text = getURL("https://raw.githubusercontent.com/dataprofessor/data/master/weather-weka.csv") )

# Build model

model <- randomForest(play~ ., data = weather, ntree = 500, mtry = 4, importance = TRUE, expand.grid(stringsAsFactors = F))

# Save model to RDS file
# saveRDS(model, "model.rds")

# Read in the RF model
#model <- readRDS("model.rds")

####################################
# User interface                   #
####################################

    


####################################
# Server                           #
####################################


####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)
