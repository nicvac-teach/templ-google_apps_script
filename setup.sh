#!/bin/bash

if ! which clasp &> /dev/null; then
    sudo npm install -g @google/clasp
fi

clasp login

