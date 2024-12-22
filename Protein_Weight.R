#Protein_Weight.R

rm(list = ls())  # Removes objects from the environment

# Amino acid masses
amino_acid_masses <- c(
  A = 89.09,  R = 174.20, N = 132.12, D = 133.10, C = 121.15, 
  E = 147.13, Q = 146.15, G = 75.07,  H = 155.16, I = 131.17, 
  L = 131.17, K = 146.19, M = 149.21, F = 165.19, P = 115.13, 
  S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
)

# Function to calculate protein weight
calculate_protein_weight <- function(protein_sequence) {
  protein_sequence <- toupper(trimws(protein_sequence)) 
  amino_acids <- unlist(strsplit(protein_sequence, ""))
  length_of_acid <- length(amino_acids)
  
  # Check for invalid amino acids
  invalid_aa <- setdiff(amino_acids, names(amino_acid_masses))
  if (length(invalid_aa) > 0) {
    stop(paste("Invalid amino acids found:", paste(invalid_aa, collapse = ", ")))
  }
  
  molecular_weight <- sum(amino_acid_masses[amino_acids])
  weight <- molecular_weight - ((length_of_acid - 1) * 18.015)  # Subtract water mass for peptide bonds
  return(weight)
}