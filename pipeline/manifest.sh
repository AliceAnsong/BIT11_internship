#!/bin/bash

#check if manifest.tsv exists
if  [! -e ${snakemake_output[1]}]; then
    touch ${snakemake_output[1]}
fi

#append sample to manifest
echo -e "${snakemake_wildcards[sample]}\tcase\t${snakemake_output[0]}" >> ${snakemake_output[1]}
