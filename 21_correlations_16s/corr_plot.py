#!/usr/bin/env python

import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import argparse

# Argument parser to handle input and output arguments
parser = argparse.ArgumentParser(description="Generate a correlation heatmap.")
parser.add_argument("-i", "--input", required=True, help="Input TSV file containing data.")
parser.add_argument("-o", "--output", required=True, help="Base name for output files (SVG and PNG).")
args = parser.parse_args()

# Load the data (assuming TSV format)
df = pd.read_csv(args.input, sep='\t')

# Verify required columns
required_columns = {'taxa', 'amp', 'group', 'value', 'pvalue'}
missing_columns = required_columns - set(df.columns)
if missing_columns:
    raise ValueError(f"The following required columns are missing from the input file: {missing_columns}")

# Combine 'amp' and 'group' to differentiate them in the x-axis
# df['amp_group'] = "(" + df['group'] + ") " + df['amp']

# Pivot the data for heatmap compatibility
heatmap_data = df.pivot(index='taxa', columns='amp', values='pvalue')

# Custom sorting function for taxa
def custom_sort(taxa):
    order = {'p_': 0, 'c_': 1, 'o_': 2, 'f_': 3, 'g_': 4, 's_': 5}
    for prefix in order:
        if taxa.startswith(prefix):
            return order[prefix]
    return len(order)  # If no prefix matches, place it at the end

# Sort the taxa names using the custom sorting function
heatmap_data = heatmap_data.loc[sorted(heatmap_data.index, key=custom_sort)]

# Calculate the correlation matrix
correlation_matrix = df.pivot(index='taxa', columns='amp', values='value')

# Sort the correlation matrix to match the heatmap data
correlation_matrix = correlation_matrix.loc[heatmap_data.index]

# Plot the heatmap
plt.figure(figsize=(8, 9))
ax = sns.heatmap(heatmap_data, annot=correlation_matrix, fmt='.2f', cmap="Reds_r", 
                 cbar_kws={'label': 'P-value'}, linewidths=0.5, linecolor='gray')

# Customizing the plot
plt.title("", fontsize=14)
plt.xlabel("", fontsize=12)
plt.ylabel("", fontsize=12)
plt.xticks(rotation=45, ha='right')
plt.tight_layout()

# Save the plot to SVG and PNG
svg_output = f"{args.output}.svg"
png_output = f"{args.output}.png"
plt.savefig(svg_output, format="svg")
plt.savefig(png_output, format="png")

# Print success message
print(f"Heatmap saved as {svg_output} and {png_output}")
