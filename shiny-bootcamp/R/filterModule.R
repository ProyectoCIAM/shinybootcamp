filterGenderUI <- function(id, label = "Sexos", gender = "male") {
    ns <- NS(id)

    tagList(
        radioButtons(ns("gender"), label = label, choices = c("male", "female"), selected = gender)
    )
}

filterGenderServer <- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
        return(reactive({
            input$gender
        }))
    }
  )
}