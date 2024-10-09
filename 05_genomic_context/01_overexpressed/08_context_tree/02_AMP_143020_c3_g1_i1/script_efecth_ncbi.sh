#/bin/bash

efetch -db nuccore -id BK026787.1 -format gff3 > BK026787.1.gff3
efetch -db nuccore -id BK058526.1 -format gff3 > BK058526.1.gff3
efetch -db nuccore -id CP133078.1 -format gff3 > CP133078.1.gff3
efetch -db nuccore -id CP014223.1 -format gff3 > CP014223.1.gff3

wait