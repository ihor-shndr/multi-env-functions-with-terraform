app_name=$1

## check that app name is not empty
if [ -z "$app_name" ]; then
  echo "Error: Please provide app name."
  exit 1
fi

## store app name in GitHub
gh variable set APP_NAME --body "$app_name"


## create Azure credentials
./create-azure-credentials.sh $app_name


## create storage for Terraform
./create-storage.sh $app_name
