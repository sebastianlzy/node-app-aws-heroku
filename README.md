# Objective

A demo to guide migration from Heroku Postgres to AWS RDS Postgres

# Setup

## 1. Create Cloud9 instance

1. Sign in to the AWS Management Console and open the Cloud9 console at https://ap-southeast-1.console.aws.amazon.com/cloud9/home
2. Choose `Create environment`
3. Select `t3.small` instance type
4. Enter a name and choose `Next step`
5. Use default settings and choose `Next step`
6. Review settings and choose `Create environment`

## 2. Configure cloud9 environment

1. Create a terminal shell
2. Beside the welcome tab, click `+`
3. Choose `New Terminal`
4. Run `git clone https://github.com/sebastianlzy/node-app-aws-heroku` 
5. Run `. ./setup-helper/install-prerequisite.sh`

## 3. Create a new RDS postgres 13 database in AWS

1. Sign in to the AWS Management Console and open the RDS console at https://ap-southeast-1.console.aws.amazon.com/rds/home
2. Choose `Create database`
3. Choose `Standard create`
4. Under Engine options
    1. For engine type, choose `PostgresSQL`
    2. For version, choose `PostgresSQL 13.2-R1`
5. Under Templates
    1. Choose Dev/Test
6. Under Settings
    1. Enter `aws-rds-postgres` as "DB instance identifier"
    2. Enter `postgres` as "username"
    3. Enter a password for the "Master password"
    4. Enter the same password for "Confirm password"
7. Under DB instance class
    1. Choose `Burstable classes`, then select `db.t3.micro`
8. Leave the rest as default and choose `Create database`
9. Wait for database to be created
10. Under connectivity & security
    1. Copy the Endpoint value
    
## 4. Migrate data from heroku:postgres database

1. Sign in to Heroku and navigate to the app at [https://dashboard.heroku.com/apps](https://dashboard.heroku.com/apps)
2. On the app, choose `Settings`
3. Under Config Vars, choose `Reveal Config Vars`
    1. Copy the value for `DATABASE_URL`

## 5. On cloud9 terminal

1. export env variable
```
> export HEROKU_POSTGRES_URL= <Value copied from Heroku Postgres (Step 4.3.1) 
> export RDS_POSTGRES_URL=<Value copied from AWS RDS Postgres (Step 3.10.1)>     
> export RDS_POSTGRES_PASSWORD=<Value copied from AWS RDS Postgres (Step 6.3)>   
```

1. Download data from Heroku
    1. Run `pg_dump -v -Fc $HEROKU_POSTGRES_URL`
2. Restore data to AWS RDS
    1. Run `pg_restore -v -h $RDS_POSTGRES_URL -U postgres -d postgres < db.dmp  `
    
    
