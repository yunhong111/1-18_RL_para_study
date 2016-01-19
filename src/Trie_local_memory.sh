#!/bin/bash
# Trie script

keyFile=300k_rule_subset-evict-noise-withID-

ipfileFolder=~/Research/PCAP/mapped_caida_trace/

memSize=(120 100 200 250 300 320 340 360 380 410 450)

feedbackPortion=(0.01 0.05 0.1 0.2 0.4 0.6)

interval=(2000000 5000000 10000000 20000000 50000000 100000000)

blackKeySize=(500 1000 1500 2000 4000 8000)

alpha=(0.1 0.2 0.3 0.4 0.5 0.6)

gama=(0.5 0.6 0.7 0.8 0.9 1.0)

epse=(0 0.1 0.2 0.3 0.4 0.5)

for i in $(seq 0 5)

do
	export OMP_NUM_THREADS=8

	./trieNoiseMain ${keyFile} ${memSize[0]} ${ipfileFolder} ${feedbackPortion[2]} ${interval[0]} ${blackKeySize[1]} ${alpha[i]} ${gama[3]} ${epse[2]}
 
done

for j in $(seq 0 5)

do
	export OMP_NUM_THREADS=8

	./trieNoiseMain ${keyFile} ${memSize[0]} ${ipfileFolder} ${feedbackPortion[2]} ${interval[0]} ${blackKeySize[1]} ${alpha[0]} ${gama[j]} ${epse[2]}
 
done

for l in $(seq 0 5)

do
	export OMP_NUM_THREADS=8

	./trieNoiseMain ${keyFile} ${memSize[0]} ${ipfileFolder} ${feedbackPortion[2]} ${interval[0]} ${blackKeySize[1]} ${alpha[0]} ${gama[3]} ${epse[l]}
 
done






