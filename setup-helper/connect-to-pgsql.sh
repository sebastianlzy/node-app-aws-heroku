
echo "Connecting to RDS Postgres"
echo "> psql postgres://$RDS_POSTGRES_USERNAME:@$RDS_POSTGRES_URL:5432"
read -s wait

psql postgres://$RDS_POSTGRES_USERNAME:@$RDS_POSTGRES_URL:5432