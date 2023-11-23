app_name=$1

## read subscription ID
subscription_id=$(az account list --query "[0].id" --output tsv)

## create credentials for Terraform
azure_credentials=$(az ad sp create-for-rbac --name serivce-principal-$app_name --role Contributor --scopes /subscriptions/$subscription_id --json-auth)

## store credentials as GitHub secret
gh secret set AZURE_CREDENTIALS -a actions -b "$azure_credentials"

echo "Azure credentials are stored in GitHub"

echo $azure_credentials