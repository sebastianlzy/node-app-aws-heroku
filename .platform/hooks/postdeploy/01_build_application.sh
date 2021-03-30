#!/bin/bash

echo "npm install"
npm install

echo "npm install --only=dev --no-shrinkwrap"
npm install --only=dev --no-shrinkwrap

echo "npm run build "
npm run build