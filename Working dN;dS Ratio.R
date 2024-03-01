# install and load packages
install.packages("ape") # Install if not already installed
install.packages("phangorn") # Install if not already installed
library(ape)
library(phangorn)

# Set working directory
setwd("/Users/jimmie/Desktop/R files Research practice")

# Load Multiple Sequence Alignment
# Replace "your_alignment.fasta" with the path to your alignment file
alignment_list <- read.dna("beste.fasta", format = "fasta")

# Compute a distance matrix
dist_matrix <- dist.dna(alignment_list)

# Check for and remove any NA values from the distance matrix
dist_matrix[is.na(dist_matrix)] <- 0

# Construct a Phylogenetic Tree using UPGMA method
tree <- upgma(dist_matrix)

# Calculate dN/dS ratio
dnds_ratios <- dnds(alignment_list)

# Print dN/dS ratios
print(dnds_ratios)

# Create a matrix from dN/dS ratios
dnds_ratios_mat <- as.matrix(dnds_ratios)

# Print the matrix
print(dnds_ratios_mat)

# Calculate the average dN/dS ratio for each Termitomyces strain
avg_dnds_ratios <- rowMeans(dnds_ratios_mat)

# Create a data frame with the average dN/dS ratios
avg_dnds_df <- data.frame(Strain = rownames(dnds_ratios_mat), Average_dNdS_ratio = avg_dnds_ratios)

# Print the average dN/dS ratios
print(avg_dnds_ratios)

