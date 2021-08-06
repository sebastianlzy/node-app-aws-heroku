
echo "pg_restore -v -h $RDS_POSTGRES_URL -U $RDS_POSTGRES_USERNAME  -d postgres < db.dmp"
pg_restore -v -h $RDS_POSTGRES_URL -U $RDS_POSTGRES_USERNAME  -d postgres < db.dmp
echo "pg_restore completed"

