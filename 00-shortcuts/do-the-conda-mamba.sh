#!/bin/bash -i
#make a new environment named according to the first argument,
#activate it, then install mamba there to speed installs

if [[ ${#1} -eq 0 ]] ; then
    echo 'Please enter a name for your new environment!'
    exit 0
fi

conda create -y --name $1
conda activate $1
conda install -c conda-forge mamba
#install example, using anvio as an example:
#mamba install -y -c conda-forge -c bioconda anvio==6.2
