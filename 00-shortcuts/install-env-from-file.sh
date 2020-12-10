#!/bin/bash -i

if [[ ${#1} -eq 0 ]] ; then
    echo 'Please provide a yaml file to create your environment.'
    exit 0
fi

mamba env create --file $1
