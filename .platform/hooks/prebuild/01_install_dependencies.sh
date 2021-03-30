#!/bin/bash

echo "remove package-lock.json"
rm -rf package.json

echo "Installing peer dependencies: typescript"
npm install typescript

echo "Installing peer dependencies:  dayjs"
npm install dayjs

echo "Installing peer dependencies: express"
npm install express

echo "Installing peer dependencies: eslint"
npm install eslint

echo "Installing dependency babel"
npm install babel-eslint@10.1.0

echo "npm install --production"

echo $(pwd)
echo $NODE_ENV
echo $DATABASE_URL
npm install --production