
#!/bin/bash

echo -n Enter a master password:
read -s password
echo

timestamp() {
  date +%s # current time
}

export RDS_POSTGRES_IDENTIFIER=aws-postgres-instance-$(timestamp)
echo $RDS_POSTGRES_IDENTIFIER

aws rds create-db-instance \
    --db-instance-identifier $RDS_POSTGRES_IDENTIFIER \
    --db-instance-class db.t3.micro \
    --engine postgres \
    --engine-version "13.2"\
    --master-username postgres \
    --master-user-password $password \
    --allocated-storage 20

aws rds describe-db-instances --db-instance-identifier $RDS_POSTGRES_IDENTIFIER > $RDS_POSTGRES_IDENTIFIER.json

export RDS_POSTGRES_URL=$(cat ./$RDS_POSTGRES_IDENTIFIER.json | jq -c ".[][0].Endpoint.Address")
export RDS_POSTGRES_PASSWORD=$password

echo $RDS_POSTGRES_URL