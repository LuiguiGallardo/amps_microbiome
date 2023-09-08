#!/bin/bash

for k in $(cat ids_trans_024.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 024_amps_trans.blastn &
for k in $(cat ids_trans_074.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 074_amps_trans.blastn &
for k in $(cat ids_trans_090.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 090_amps_trans.blastn &
for k in $(cat ids_trans_146.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 146_amps_trans.blastn &
for k in $(cat ids_trans_153.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 153_amps_trans.blastn &
for k in $(cat ids_trans_258.txt) ; do grep -w $k 193_amps_trans_filt.blastn ; done > 258_amps_trans.blastn &

wait
