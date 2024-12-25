install.packages("shiny")

library(shiny)
library(ggplot2)

# Load functions from your scripts
source("Amino_Plot.R", local = TRUE)
source("Protein_Weight.R", local = TRUE)

# UI
ui <- fluidPage(
  titlePanel("Protein Analysis Tool"),
  sidebarLayout(
    sidebarPanel(
      textInput("protein_sequence", "Enter Protein Sequence:", ""),
      actionButton("analyze", "Analyze")
    ),
    mainPanel(
      textOutput("molecular_weight"),
      plotOutput("aa_plot")
    )
  )
)

# Server
server <- function(input, output) {
  observeEvent(input$analyze, {
    req(input$protein_sequence)
    protein_seq <- toupper(trimws(input$protein_sequence))
    
    # Calculate molecular weight
    output$molecular_weight <- renderText({
      tryCatch({
        paste("Molecular weight:", calculate_protein_weight(protein_seq), "Daltons")
      }, error = function(e) {
        paste("Error:", e$message)
      })
    })
    
    # Generate plot
    output$aa_plot <- renderPlot({
      tryCatch({
        aaplot(protein_seq)
      }, error = function(e) {
        NULL
      })
    })
  })
}

# Run the app
shinyApp(ui, server)
