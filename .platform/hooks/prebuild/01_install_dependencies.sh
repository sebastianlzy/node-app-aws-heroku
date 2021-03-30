#!/bin/bash

echo "remove package-lock.json"
rm -rf package-lock.json

echo "Installing peer dependencies: typescript"
npm install typescript

echo "Installing peer dependencies: dayjs"
npm install dayjs

echo "Installing peer dependencies: express"
npm install express

echo "Installing peer dependencies: eslint"
npm install eslint

echo "Installing peer dependency: babel"
npm install babel-eslint@10.1.0

echo "npm install"
npm install

echo "npm install --only=dev --no-shrinkwrap"
npm install --only=dev --no-shrinkwrap

