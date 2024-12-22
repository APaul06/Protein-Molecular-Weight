#Amino_Plot.R
library(ggplot2)

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
aaplot <- function(protein_sequence) {
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
print(aaplot(protein_sequence))  # Use print() to show plot