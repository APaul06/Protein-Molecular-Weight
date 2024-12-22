Protein Molecular Weight Calculator and Visualizer
-
This project provides tools to calculate the molecular weight of proteins and visualize their amino acid sequences. It consists of three main R scripts that work together to analyze protein sequences.
 
Features:
-
'Calculate the molecular weight of a given protein sequence
'Visualize protein sequences with color coded amino acids based on their properties
'Interactive command line interface for easy protein analysis
 
Protein_Weight.R: Contains functions for calculating protein molecular weight
Amino_Plot.R: Provides functionality for visualizing protein sequences
main_script.R: The main script that integrates the other two files and provides a user interface

Usage:
-
'Ensure you have R installed on your system.
'Install the required package:
'install.packages("ggplot2")
'Run the main_script.R file:
'source("path/to/main_script.R")

Enter protein sequences when prompted. The program will calculate the molecular weight and display a visualization of the sequence. 
Type 'quit' to exit the program.
 
Functions:
-
calculate_protein_weight(protein_sequence):
Calculates the molecular weight of a given protein sequence, accounting for peptide bond formation
aaplot(protein_sequence):
Generates a plot visualizing the protein sequence with amino acids color coded based on their properties.
 
The visualization uses the following color scheme for amino acids:
-
Red: Hydrophobic (A, V, I, L, M, F, W, Y)
Blue: Polar (N, Q, S, T, C)
Green: Acidic (D, E)
Purple: Basic (R, K, H)
Gray: Others (G, P)
 
Notes:
-
The project uses the ggplot2 library for visualization
Amino acid masses are predefined in the Protein_Weight.R script
The main script provides error handling for invalid amino acids
