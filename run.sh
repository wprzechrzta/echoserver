#!/usr/bin/env bash

servers=("localhost:3000" "localhost:3001")
for srv in ${servers[@]}; do
    echo "Call $srv"
    curl "$srv/?echo_body=amazing-from-srv=$srv"
    echo ""
done