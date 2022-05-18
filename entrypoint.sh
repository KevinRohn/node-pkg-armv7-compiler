#!/bin/bash

set -e

if [[ -z "$1" ]] || [[ -z "$2" ]] || [[ -z "$3" ]];  then
  echo "Please provide all required variables"
  exit 1
else
  INPUT_PATH=$1
  OUTPUT_PATH=$2
  NODE_VERSION=$3
  if [[ ! -d "$INPUT_PATH" ]]; then
    echo "Input path $INPUT_PATH does not exist"
    exit 1
  fi
  if [[ ! -d "$OUTPUT_PATH" ]]; then
    echo "Output path $OUTPUT_PATH does not exist"
    exit 1
  fi
fi

# Install packages first
npm --prefix $INPUT_PATH install --only=production

INPUT_CLEAN_PATH=$(echo $INPUT_PATH | tr -s /)
pkg "$INPUT_CLEAN_PATH"/package.json --target "$NODE_VERSION"-linux-armv7 --out-path $OUTPUT_PATH