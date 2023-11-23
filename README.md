## Set up credentials in GitHub:

1. Specify your subscription ID, App name and Environment in .`env` file
2. run `create-service-principal.sh` to create credentials for `GitHub`
3. copy the JSON output and store it as `AZURE_CREDENTIALS` secret in GitHub



## Set up terraform state for environment:
1. run `create-storage-account.sh` to create a storage for terraform state
2. update the value for `STORAGE_ACCOUNT` in .env file
3. commit changes

## Create infrastructure from local machine:
1. set environment in `create-infrastructure.sh` script
2. run `create-infrastructure.sh` from `scripts` folder 