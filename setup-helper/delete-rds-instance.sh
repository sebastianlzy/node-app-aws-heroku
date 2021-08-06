echo 'Deleting RDS instance'
aws rds delete-db-instance --db-instance-identifier $RDS_POSTGRES_IDENTIFIER --skip-final-snapshot