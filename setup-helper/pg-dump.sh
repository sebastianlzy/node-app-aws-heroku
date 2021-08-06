#!/bin/bash

echo ""
echo -n Enter the credential to login to Heroku Posgres:
read -s HEROKU_POSTGRES_CREDENTIAL
echo

echo "Dumping data from Heroku Postgres to temporary file, db.tmp"
echo "> pg_dump -v -Fc <HEROKU CREDENTIAL> > db.dmp"
read -s wait

pg_dump -v -Fc $HEROKU_POSTGRES_CREDENTIAL > db.dmp
echo "pg_dump completed"

