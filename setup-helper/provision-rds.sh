
#!/bin/bash

echo -n Enter a master password:
read -s password
echo

aws rds create-db-instance \
    --db-instance-identifier aws-postgres-instance \
    --db-instance-class db.t3.micro \
    --engine postgres \
    --engine-version "13.2"\
    --master-username postgres \
    --master-user-password $password \
    --allocated-storage 20

aws rds describe-db-instances --db-instance-identifier aws-postgres-instance > aws-postgres-instance.json

export RDS_POSTGRES_URL=$(cat ./aws-postgres-instance.json | jq -c ".[][0].Endpoint.Address")
export RDS_POSTGRES_PASSWORD=$password

echo $RDS_POSTGRES_URL