# STR-genotyping snakemake pipeline
This Snakemake pipeline detects Short Tandem Repeats (STRs) in genomic samples. It supports multiple STR genotyping tools :
-	ExpansionHunter Denovo 
-	HipSTR
-	GangSTR 
-	STRetch 

This pipeline was built using high-coverage CRAM files, but it should also work for BAM files.

## Installation
### Requirements
- Conda, here is the [documentation](https://github.com/conda-forge/miniforge) on how to install it.
- Snakemake, this is included in the Snakemake environment file

### Setup
1.	Clone the git repository:
```
$ git clone https://github.com/AliceAnsong/BIT11_internship.git
```
2.	Create the conda environment using the snakemake.yaml file provided in the envs directory:
```
$ cd BIT11_internship/pipeline/
$ conda env create -f envs/snakemake.yaml
```
3.	Activate the environment :
```
$ conda activate snakemake
```

### STR-tools
Install the following tools using their GitHub documentation in a tools subdirectory of BIT11_internship/pipeline/ :
-	ExpansionHunter Denovo: 
https://github.com/Illumina/ExpansionHunterDenovo
-	HipSTR:
https://github.com/HipSTR-Tool/HipSTR
-	STRetch:
https://github.com/Oshlack/STRetch
- [GangSTR](https://github.com/gymreklab/GangSTR) is already included in the snakemake.yaml file so it does not need to be installed again.

## Running the pipeline
1.	Go to the directory:
```
$ cd BIT11_internship/pipeline/
```
2.	Activate the conda environment :
```
$ conda activate snakemake
```
3.	Place your sample files (CRAM/BAM) in a subdirectory.
4.	Place your reference genome in another subdirectory. 
The exact names of these subdirectories does not matter, because their paths need to be defined in the config.yaml file.
5.	Modify the config.yaml file
6.	A couple of things need to be added to your .bashrc to make tools executable wherever (modify paths as needed):
```
export PATH="tools/EHdn/bin:$PATH" 
export PATH="tools/HipSTR:$PATH"
export PATH="tools/STRetch/tools/bwa.kit:$PATH"
export PATH="tools/STRetch/tools/bin:$PATH"
```
7.	Run Snakemake; it is recommended to use SLURM. This pipeline also requires `–use-conda` for managing environments per rule
```
$ snakemake --profile slurm --use conda
```
