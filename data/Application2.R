library(tidyverse)
library(lubridate)
library(shiny)

#In the principals table, there is a `category` column. 
#Use this column as a primary filter to allow users to then select specific job categories. 
#After select the specific job categories, display information from another table.

ui <- fluidPage(
  titlePanel("Job Category"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Job Category", 
                  choices = unique(title_principals$category)),
      uiOutput("job_category")
    ),
    
    mainPanel(
      tableOutput("job_info")
    )
  )
)

server <- function(input, output) {
  output$job_category <- renderUI({
    job_categories <- unique(title_principals$job_category[title_principals$category == input$category])
    selectInput("job_category", "Select Job Category", choices = job_categories)
  })
  
  
}

shinyApp(ui = ui, server = server)


