#!/usr/bin/env Rscript
## Purpose of script: Spearman correlation and network
## Date created: 24.10.2020
## Author: luigui gallardo-becerra (bfllg77@gmail.com)
args = commandArgs(trailingOnly=TRUE)
# Package installation
#install.packages("Hmisc")
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("reshape2")
#install.packages("rlist")
#install.packages("igraph")
library(Hmisc)
library(dplyr)
library(ggplot2)
library(reshape2)
library(rlist)
library(igraph)
# Data input: correlation matrix
melted_cormat <- read.delim(file = args[1], header = TRUE)
net.grph=graph.data.frame(melted_cormat, directed = FALSE)
edgew<-E(net.grph)$value
layoutform <- layout_with_kk(net.grph)
# Colors of nodes
V(net.grph)$color <- "lightgray"# This is the color of functional nodes
for (s in unique(melted_cormat$Var1)){V(net.grph)[[s]]$color <- "white"} # This is the color of taxonomical nodes
try({V(net.grph)["age"]$color <- "cadetblue3"})
try({V(net.grph)["weight"]$color <- "cadetblue3"})
try({V(net.grph)["size"]$color <- "cadetblue3"})
try({V(net.grph)["bmi"]$color <- "cadetblue3"})
try({V(net.grph)["waist_circumference"]$color <- "cadetblue3"})
try({V(net.grph)["systolic_bp_percentile"]$color <- "cadetblue3"})
try({V(net.grph)["diastolic_bp_percentile"]$color <- "cadetblue3"})
try({V(net.grph)["glucose"]$color <- "cadetblue3"})
try({V(net.grph)["tg"]$color <- "cadetblue3"})
try({V(net.grph)["hdl"]$color <- "cadetblue3"})
try({V(net.grph)["total_colesterol"]$color <- "cadetblue3"})
try({V(net.grph)["ldl"]$color <- "cadetblue3"})
# Creation of network and pdf
pdf(file = args[2], width = 17, height =17) # The size of the pdf could be changed
plot(net.grph,
#    layout = layoutform,
    edge.width = ifelse(edgew < 0, (edgew*-5),(edgew*5)),
    edge.color=ifelse(edgew < 0,"tomato","cornflowerblue"),
#    vertex.size = 6,
#    vertex.label.cex=0.5
)
dev.off()
# Creation of png
png(file = args[3], width = 500, height = 500) # Filename
plot(net.grph,
#    layout = layoutform,
    edge.width = ifelse(edgew < 0, (edgew*-5),(edgew*5)),
    edge.color=ifelse(edgew < 0,"tomato","cornflowerblue"),
#    vertex.size = 6,
#    vertex.label.cex=0.5
)
dev.off()
