library(shiny)
library(readr)
library(dplyr)

data <- read_csv("titanic_dataset.csv")

server <- function(input, output, session) {

    # Module reactive output
    selected_gender <- filterGenderServer("gender")

    # Reactive table
    filtered_table <- reactive({
        data %>%
            filter(Sex == selected_gender())
    })

    # Rendering Titanic Passengers Sex Plot
    output$sexo <- renderPlot({
        num_males <- sum(ifelse(filtered_table()$Sex == "male", 1, 0))
        num_females <- length(filtered_table()$Sex) - num_males
        total_sex <- c(num_males, num_females)

        barplot(total_sex, xlab="sex", ylab="frecuency", main="Titanic Passengers Sex")
    })

     # Rendering the complete table from the csv file
    output$table <- renderTable(filtered_table())
}