#!/bin/bash

input_directory="templates"
output_directory="transformed"

if [ -f ../set-env.sh ]; then
    echo "Sourcing ../set-env.sh"
    source ../set-env.sh
fi

rm -rf $output_directory

ruby ./transform_templates.rb -i $input_directory -o $output_directory

tree $output_directory