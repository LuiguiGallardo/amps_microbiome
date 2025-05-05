#!/bin/bash
# Title: script_bowtie_genome_context.sh
# Purpose: Genome context with bowtie2
# Author: Luigui Gallardo-Becerra (bfllg77@gmail.com)
# Date: 01.04.2024

# Beginning of the script
#bowtie2-build $1/$1.fasta $1/$1
#bowtie2 -x $1/$1 -1 <(zcat ../../00_rawdata/allsamples_R1.fq.gz) -2 <(zcat ../../00_rawdata/allsamples_R2.fq.gz) --end-to-end --very-sensitive --threads 12 --no-unal -S $1/$1\_allsamples_aligned.sam
#samtools view -bS $1/$1\_allsamples_aligned.sam > $1/$1\_allsamples_aligned.bam
#bedtools bamtobed -i $1/$1\_allsamples_aligned.bam > $1/$1\_allsamples_aligned.bed
bedtools genomecov -i $1/$1\_allsamples_aligned.bed -g $1/genome.txt -d > $1/$1\_allsamples_aligned_genomecov.txt
bedtools genomecov -i $1/$1\_allsamples_aligned.bed -g $1/genome.txt | awk '$2 > 0 {print}' | awk '{coverage[$1] += $5} END {for (attribute in coverage) print attribute, coverage[attribute]}' | tr " " "\t" > $1/$1\_total_coverage_per_contig.txt
#gzip $1/$1*.sam
#gzip $1/$1*.bam
gzip $1/$1*.bed
wait
# The end!
