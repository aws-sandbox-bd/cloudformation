#!/bin/bash

# Run using `bin/cf-validate temlpates` 

for template in `find $1 -name "*.yaml"`; do
    aws cloudformation validate-template --template-body "file://$template" || exit 1
    cfn-lint --template $template -i W3002 W6001 || exit 1
done

