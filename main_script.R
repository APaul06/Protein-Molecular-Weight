#main_script.R

library(ggplot2)

# Source Protein_Weight.R
source("C:\\Users\\alanp\\OneDrive - Temple University\\Desktop\\Projects\\Protein-Molecular-Weight\\Protein_Weight.R", local = TRUE)

# Input and plot
repeat {
  cat("\nEnter the protein sequence or type 'quit' to exit:\n")
  protein_sequence <- readline()
  
  #Source Amino_Plot.R
  source("C:\\Users\\alanp\\OneDrive - Temple University\\Desktop\\Projects\\Protein-Molecular-Weight\\Amino_Plot.R", local = TRUE)
  
  if (tolower(protein_sequence) == "quit") {
    cat("Exiting the program. Goodbye!\n")
    break
  }
  
  # Display protein weight
  tryCatch({
    protein_weight <- calculate_protein_weight(protein_sequence)
    cat("Molecular weight of the protein:", protein_weight, "Daltons\n")
  }, error = function(e) {
    cat("Error:", e$message, "\n")
  })
}