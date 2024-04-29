library(shiny)
library(tidyverse)

# this will load the table `homeproject` into the environment
load("aha_projects.rda")

ui <- fluidPage(
  
  # Application title
  titlePanel("Template"),
  
  sidebarLayout(
    sidebarPanel(
      p("This is a placeholder")
    ),
    
    mainPanel(
      p("This is also a placeholder")
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)
