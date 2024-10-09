#/bin/bash

efetch -db nuccore -id BK038133.1 -format gff3 > BK038133.1.gff3
efetch -db nuccore -id CP107216.1 -format gff3 > CP107216.1.gff3
efetch -db nuccore -id BK027835.1 -format gff3 > BK027835.1.gff3
efetch -db nuccore -id BK026979.1 -format gff3 > BK026979.1.gff3
efetch -db nuccore -id BK025808.1 -format gff3 > BK025808.1.gff3
efetch -db nuccore -id BK033981.1 -format gff3 > BK033981.1.gff3

wait