#!/bin/bash


echo "Setup EB environment variable"
echo "> eb setenv NODE_ENV=production DATABASE_URL=postgres://$RDS_POSTGRES_USERNAME:<password>@$RDS_POSTGRES_URL:5432/$RDS_POSTGRES_SCHEMA"
read -s wait

eb setenv NODE_ENV=production DATABASE_URL=postgres://$RDS_POSTGRES_USERNAME:$RDS_POSTGRES_PASSWORD@$RDS_POSTGRES_URL:5432/$RDS_POSTGRES_SCHEMA