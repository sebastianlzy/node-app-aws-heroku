
echo "pg_restore -v -h $1 -U postgres  -d postgres < db.dmp"
pg_restore -v -h $1 -U postgres  -d postgres < db.dmp
echo "pg_restore completed"

