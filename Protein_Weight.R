library(ggplot2)

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

# Function to assign colors to amino acids based on their properties
get_aa_color <- function(aa) {
  aa_properties <- list(
    hydrophobic = c("A", "V", "I", "L", "M", "F", "W", "Y"),
    polar = c("N", "Q", "S", "T", "C"),
    acidic = c("D", "E"),
    basic = c("R", "K", "H"),
    others = c("G", "P")
  )
  
  aa_colors <- c(
    hydrophobic = "red",    # Red for hydrophobic
    polar = "blue",         # Blue for polar
    acidic = "green",       # Green for acidic
    basic = "purple",       # Purple for basic
    others = "gray"         # Gray for others
  )
  
  # Loop through the properties to find the color
  for (category in names(aa_properties)) {
    if (aa %in% aa_properties[[category]]) {
      return(aa_colors[category])
    }
  }
  return("gray")  #If no category found
}

# Function to plot the protein sequence
plot_aa_sequence <- function(protein_sequence) {
  protein_sequence <- toupper(trimws(protein_sequence))
  amino_acids <- unlist(strsplit(protein_sequence, ""))
  
  # Assign colors based on properties
  aa_colors <- sapply(amino_acids, get_aa_color)
  
  # Create data frame for plotting
  aa_data <- data.frame(
    position = 1:length(amino_acids),
    amino_acid = amino_acids,
    color = aa_colors
  )
  
  # Plotting using ggplot2
  ggplot(aa_data, aes(x = position, y = 1, color = color)) +
    geom_point(size = 5) +  # Add colored points
    scale_color_identity() +  # Use predefined colors
    theme_minimal() +
    theme(axis.text.y = element_blank(),  # Hide y-axis labels
          axis.ticks.y = element_blank(), # Hide y-axis ticks
          panel.grid = element_blank()) + # Hide grid lines
    labs(title = "Protein Sequence Visualization", x = "Position in Sequence", y = "")
}