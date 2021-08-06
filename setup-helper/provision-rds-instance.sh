
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

aws rds create-db-instance \
    --db-instance-identifier $RDS_POSTGRES_IDENTIFIER \
    --db-instance-class db.t3.micro \
    --engine postgres \
    --engine-version $RDS_POSTGRES_VERSION\
    --master-username $RDS_POSTGRES_USERNAME \
    --master-user-password $RDS_POSTGRES_PASSWORD \
    --allocated-storage 20

# Wait until db is creating
echo "Creating Database..."
aws rds wait db-instance-available --db-instance-identifier $RDS_POSTGRES_IDENTIFIER

aws rds describe-db-instances --db-instance-identifier $RDS_POSTGRES_IDENTIFIER > $RDS_POSTGRES_IDENTIFIER.json

export RDS_POSTGRES_URL=$(cat ./$RDS_POSTGRES_IDENTIFIER.json | jq -c ".[][0].Endpoint.Address" | tr -d '"')
export RDS_POSTGRES_PASSWORD=$password

echo "Database created with public endpoint: $RDS_POSTGRES_URL"