#! /bin/bash

VERBOSE=${VERBOSE:-0}

SCRIPT_PATH=$(realpath "$0")
CONFIG_ROOT=$(dirname "$SCRIPT_PATH")/../

cd $CONFIG_ROOT

if [ $VERBOSE -eq 1 ]; then
    docker build -t nvim:latest -f docker/Dockerfile .
else
    docker build -t nvim:latest -f docker/Dockerfile .
fi
