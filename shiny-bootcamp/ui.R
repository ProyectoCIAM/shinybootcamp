library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "hola")

sidebar <- dashboardSidebar(
  filterGenderUI("gender", label = "Generos", gender = "female")
)

body <- dashboardBody(
      box(plotOutput("sexo")),
      tableOutput("table")
  )

dashboardPage(header, sidebar, body)