library(tidyverse)
library(lubridate)
library(shiny)

#THIS IS MY HOMEWORK 9 - WANT TO USE IT AS A TEMPLATE

homeproject_req <- homeproject %>% 
  mutate(Required = ifelse(grepl("required", JOBTYPE), "Yes", "No"))

ui <- fluidPage(
  titlePanel("Required vs Non-Required"),
  sidebarLayout(
    sidebarPanel(
      selectInput("required", "Select Required or Non-Required Jobs:",
                  choices = c("All", "Required", "Non-Required")),
      uiOutput("job_type_select")
    ),
    mainPanel(
      plotOutput("job_plot")
    )
  )
)

server <- function(input, output) {
  
  output$job_type_select <- renderUI({
    if (input$required == "All") {
      return(NULL)
    } else {
      selectInput("job_type", "Select Job Type:", 
                  choices = unique(homeproject_req$JOBTYPE))
    }
  })
  
  filtered_data <- reactive({
    if (input$required == "All") {
      return(homeproject_req)
    } else if (input$required == "Required") {
      return(filter(homeproject_req, Required == "Yes"))
    } else {
      return(filter(homeproject_req, Required == "No"))
    }
  })
  
  output$job_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = JOBTYPE)) +
      geom_bar() +
      coord_flip()
  })
}

shinyApp(ui = ui, server = server)  