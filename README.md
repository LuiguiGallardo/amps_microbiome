# amps_microbiome

Data, intermediate results and figure-generation code for:

> **Bioactive Plasmid- and Phage-Encoded Antimicrobial Peptides (AMPs) in the Human Gut: A Metatranscriptome–Virome Profiling Reveals Exploratory Links to Metabolic Human Diseases.**
> *Microbial Ecology* 89, 15 (2025).
> DOI: [10.1007/s00248-025-02620-2](https://doi.org/10.1007/s00248-025-02620-2) · [Article](https://link.springer.com/article/10.1007/s00248-025-02620-2)

## Overview

Fecal metatranscriptomes from individuals with normal weight (NW), obesity (O) and obesity with metabolic syndrome (OMS) were assembled (51,087 non-human transcripts). 1,095 small ORFs were screened with AMP-prediction tools plus post-hoc filters, yielding **51 high-confidence AMP candidates**. Most matched bacterial homologs, and eight mapped to plasmids or bacteriophages. Differential expression identified AMPs overexpressed in O (2) and OMS (4), which were correlated with 16S taxa, searched in 372 external gut metatranscriptomes, and linked to phages through virome data. A phage-encoded AMP (AMP-3020) was synthesized and tested experimentally.

## Repository structure

Folders are numbered roughly in the order of the analysis.

| Folder | Content |
|---|---|
| `00_assembly` | Candidate AMP peptide/transcript sequences (`193_amps.pep`, `193_amps_trans.fna`) and length distributions |
| `01_macrel`, `02_axpep`, `03_amp_scanner` | Outputs of the three AMP predictors |
| `04_venn` | Venn diagrams of predictor overlap |
| `05_genomic_context` | Genomic context of the AMPs (overexpressed / all samples) |
| `06_deseq2` | Differential expression (DESeq2) metadata, results and volcano plot |
| `07_overexpressed_AMPs` | Overexpressed AMP tables, abundance, bar plots and box plots |
| `08_other_files` | Supporting tables, pipeline scheme and miscellaneous files |
| `09_megan6_analysis`, `17_megan6` | MEGAN6 taxonomic assignment of AMP transcripts |
| `10_blastn_besthit` | BLASTn best-hit taxonomy summaries |
| `11_gravy_net_overexpressed` | GRAVY index and net charge of overexpressed AMPs |
| `12_apd3_data` | Comparison with APD3 microbial AMPs (length, GRAVY, net charge, amino acid composition) |
| `13_apd3_genomic_context` | Genomic context of APD3 AMPs |
| `15_blastp_King_2023` | Sequences from King et al. 2023 used for BLASTp comparison |
| `16_spearman_corr`, `21_correlations_16s` | Spearman correlations between AMP expression and 16S taxa |
| `18_boxplots_rna_dna` | RNA vs DNA abundance box plots for selected AMPs |
| `19_additional_amps_databases` | Comparison with APD3, dbAMP 3 and DRAMP 4 |
| `20_reference_metatranscriptomes` | Detection in 372 external gut metatranscriptomes |
| `22_experiment_amp3020` | Antimicrobial assay data for the synthesized AMP-3020 |
| `23_protein_msa` | Protein multiple sequence alignments per AMP |
| `24_coverage_producers` | Coverage of AMP-producing genomes |
| `figures/` | Final figures (`fig1`–`fig8`, `.svg` and `.png`) and the notebooks that assemble them |
| `src/` | Helper scripts: `gravy_charge.py`, `net_charge.py`, `aminoacid_composition.py` |

## Reproducing the figures

Final figures are assembled from per-module SVG panels:

- [`figures/main_figures.ipynb`](figures/main_figures.ipynb): main figures
- [`figures/supplementary_figures.ipynb`](figures/supplementary_figures.ipynb): supplementary figures

Panels are generated in the module folders (mostly Jupyter notebooks) and combined with `svgutils`; PNG export uses Inkscape.

