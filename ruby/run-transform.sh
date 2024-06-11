#!/bin/bash

input_directory="templates"
output_directory="../output"

if [ -f ../set-env.sh ]; then
    echo "Sourcing ../set-env.sh"
    source ../set-env.sh
fi

rm -rf transformed

ruby ./transform_templates.rb -i $input_directory -o $output_directory

tree $output_directory