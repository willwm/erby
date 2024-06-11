#!/bin/bash

if [ -f ../set-env.sh ]; then
    echo "Sourcing ../set-env.sh"
    source ../set-env.sh
fi

rm -rf transformed

ruby transform_templates.rb

echo "./transformed"
tree transformed

env | grep BACKEND_

batcat transformed/etc/nginx/nginx.conf

batcat transformed/example