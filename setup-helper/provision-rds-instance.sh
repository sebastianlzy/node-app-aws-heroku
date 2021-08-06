#!/bin/bash

echo ""
echo -n Enter a master password:
read -s RDS_POSTGRES_PASSWORD
echo

timestamp() {
  date +%s # current time
}

export RDS_POSTGRES_IDENTIFIER=aws-postgres-instance-$(timestamp)
export RDS_POSTGRES_VERSION=13.2
export RDS_POSTGRES_USERNAME=postgres
export RDS_POSTGRES_SCHEMA=postgres

echo "Provision RDS instance using AWS CLI"
echo "> aws rds create-db-instance
    --db-instance-identifier $RDS_POSTGRES_IDENTIFIER
    --db-instance-class db.t3.micro
    --engine postgres
    --engine-version $RDS_POSTGRES_VERSION
    --master-username $RDS_POSTGRES_USERNAME
    --master-user-password <password>
    --allocated-storage 20"
read -s wait

aws rds create-db-instance \
    --db-instance-identifier $RDS_POSTGRES_IDENTIFIER \
    --db-instance-class db.t3.micro \
    --engine postgres \
    --engine-version $RDS_POSTGRES_VERSION\
    --master-username $RDS_POSTGRES_USERNAME \
    --master-user-password $RDS_POSTGRES_PASSWORD \
    --allocated-storage 20

echo "Provisioning RDS..."
echo "> aws rds wait db-instance-available --db-instance-identifier $RDS_POSTGRES_IDENTIFIER"
read -s wait
#aws rds wait db-instance-available --db-instance-identifier $RDS_POSTGRES_IDENTIFIER

echo "RDS provisioned"
echo "> aws rds describe-db-instances --db-instance-identifier $RDS_POSTGRES_IDENTIFIER > $RDS_POSTGRES_IDENTIFIER.json"
read -s wait
#aws rds describe-db-instances --db-instance-identifier $RDS_POSTGRES_IDENTIFIER > $RDS_POSTGRES_IDENTIFIER.json

echo "Extracting RDS public endpoint"
echo "> export RDS_POSTGRES_URL=$(cat ./$RDS_POSTGRES_IDENTIFIER.json | jq -c ".[][0].Endpoint.Address" | tr -d '"')"
read -s wait

export RDS_POSTGRES_URL=$(cat ./$RDS_POSTGRES_IDENTIFIER.json | jq -c ".[][0].Endpoint.Address" | tr -d '"')
export RDS_POSTGRES_PASSWORD=$password