
echo "pg_dump -v -Fc $1 > db.dmp"
pg_dump -v -Fc $1 > db.dmp
echo "pg_dump completed"

