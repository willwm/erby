#!/bin/bash -e

if [ -f ../set-env.sh ]; then
    echo "Sourcing ../set-env.sh"
    source ../set-env.sh
fi

rm -rf transformed

ruby transform_templates.rb

echo "./transformed"
tree transformed

env | grep BACKEND_

cat transformed/etc/nginx/nginx.conf

cat transformed/example