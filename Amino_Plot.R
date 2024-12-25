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
  
  for (category in names(aa_properties)) {
    if (aa %in% aa_properties[[category]]) {
      return(category)
    }
  }
  return("others")
}

# Function to plot the protein sequence
aaplot <- function(protein_sequence) {
  protein_sequence <- toupper(trimws(protein_sequence))
  amino_acids <- unlist(strsplit(protein_sequence, ""))
  
  # Assign categories based on properties
  aa_categories <- sapply(amino_acids, get_aa_color)
  
  # Create data frame for plotting
  aa_data <- data.frame(
    position = 1:length(amino_acids),
    amino_acid = amino_acids,
    category = aa_categories
  )
  
  # Define color palette
  color_palette <- c(
    hydrophobic = "red",
    polar = "blue",
    acidic = "green",
    basic = "purple",
    others = "gray"
  )
  
  # Plotting using ggplot2
  ggplot(aa_data, aes(x = position, y = 1, color = category)) +
    geom_point(size = 5) +
    scale_color_manual(values = color_palette, name = "Amino Acid Properties") +
    theme_minimal() +
    theme(axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          panel.grid = element_blank()) +
    labs(title = "Protein Sequence Visualization", x = "Position in Sequence", y = "")
}

# Print Plot
print(aaplot(protein_sequence))
