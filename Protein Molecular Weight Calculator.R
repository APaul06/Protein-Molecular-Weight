#This Project was initially Designed in Ren'Py and Python
#However I decided it would be in my best interest to learn R
#This Project will serve as my gateway into learning R
#As well as improving my original project that I have now scrapped

install.packages("stringr")

amino_acid_masses <- c(
  A = 89.09,  # Alanine
  R = 174.20, # Arginine
  N = 132.12, # Asparagine
  D = 133.10, # Aspartic acid
  C = 121.15, # Cysteine
  E = 147.13, # Glutamic acid
  Q = 146.15, # Glutamine
  G = 75.07,  # Glycine
  H = 155.16, # Histidine
  I = 131.17, # Isoleucine
  L = 131.17, # Leucine
  K = 146.19, # Lysine
  M = 149.21, # Methionine
  F = 165.19, # Phenylalanine
  P = 115.13, # Proline
  S = 105.09, # Serine
  T = 119.12, # Threonine
  W = 204.23, # Tryptophan
  Y = 181.19, # Tyrosine
  V = 117.15  # Valine
)

calculate_protein_weight <- function(protein_sequence) {
  #Split the sequence into amino acids
  amino_acids <- unlist(strsplit(protein_sequence, ""))
  
  #Check if amino acids are valid
  invalid_aa <- setdiff(amino_acids, names(amino_acid_masses))
  if (length(invalid_aa) > 0) {
    stop(paste("Invalid amino acids found:", paste(invalid_aa, collapse = ", ")))
  }
  # Calculate the molecular weight 
  molecular_weight <- sum(amino_acid_masses[amino_acids])
  return(molecular_weight)
}