#!/bin/bash

echo "Restoring data from db.tmp to RDS Postgres"
echo "> pg_restore -v -h $RDS_POSTGRES_URL -U $RDS_POSTGRES_USERNAME  -d $RDS_POSTGRES_SCHEMA < db.dmp"
read -s wait

pg_restore -v -h $RDS_POSTGRES_URL -U $RDS_POSTGRES_USERNAME  -d $RDS_POSTGRES_SCHEMA < db.dmp
echo "pg_restore completed"

