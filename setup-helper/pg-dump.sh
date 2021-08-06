
echo ""
echo -n Enter the credential to login to Heroku Posgres:
read -s HEROKU_POSTGRES_CREDENTIAL
echo

echo "pg_dump -v -Fc <HEROKU CREDENTIAL> > db.dmp"
pg_dump -v -Fc $HEROKU_POSTGRES_CREDENTIAL > db.dmp
echo "pg_dump completed"

