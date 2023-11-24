## Prerequisites
1. `GitHub CLI`
2. `Azure CLI`

## Set up Azure credentials and create storage for Terraform

run `set-up.sh` from `scripts` folder with `app name` as a first parameter. Ex: `./set-up.sh myapp`


## Add environment:
1. run `create-storage-account.sh` to create a storage for terraform state
2. update the value for `STORAGE_ACCOUNT` in .env file
3. commit changes

## Create infrastructure from local machine:
1. set environment in `create-infrastructure.sh` script
2. run `create-infrastructure.sh` from `scripts` folder 