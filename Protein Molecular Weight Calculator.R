#This Project was initially Designed in Ren'Py and Python
#However I decided it would be in my best interest to learn R
#This Project will serve as my gateway into learning R
#As well as improving my original project that I have now scrapped

install.packages("stringr")
library(stringr)

# Define amino acid masses
amino_acid_masses <- c(
  A = 89.09,  R = 174.20, N = 132.12, D = 133.10, C = 121.15, 
  E = 147.13, Q = 146.15, G = 75.07,  H = 155.16, I = 131.17, 
  L = 131.17, K = 146.19, M = 149.21, F = 165.19, P = 115.13, 
  S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
)

# Define the function to calculate molecular weight
calculate_protein_weight <- function(protein_sequence) {
  # Convert to uppercase to handle mixed cases
  protein_sequence <- toupper(trimws(protein_sequence)) 
  
  # Split the sequence into individual amino acids
  amino_acids <- unlist(strsplit(protein_sequence, ""))
  
  #find length of acid
  length_of_acid <- length(amino_acids)
  
  # Validate amino acids
  invalid_aa <- setdiff(amino_acids, names(amino_acid_masses))
  if (length(invalid_aa) > 0) {
    stop(paste("Invalid amino acids found:", paste(invalid_aa, collapse = ", ")))
  }
  
  # Calculate molecular weight
  molecular_weight <- sum(amino_acid_masses[amino_acids])
  weight <- molecular_weight -((length_of_acid-1)*18.015)
  return(weight)
}

repeat {
  cat("\nEnter the protein sequence or type 'quit' to exit:\n")
  protein_sequence <- readline()

  # Check if the user wants to quit
  if (tolower(protein_sequence) == "quit") {
    cat("Exiting the program. Goodbye!\n")
    break
  }
  tryCatch({
    protein_weight <- calculate_protein_weight(protein_sequence)
    cat("Molecular weight of the protein:", protein_weight, "Daltons\n")
  }, error = function(e) {
    cat("Error:", e$message, "\n")
  })
}
