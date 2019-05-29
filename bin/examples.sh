#!/usr/bin/env bash

function build() {
  echo "Building examples/$1/ ..."
  pulp build -I examples/$1/src --build-path ./output
  webpack --config examples/$1/webpack.config.js
}

build simple

python -m http.server 9000
