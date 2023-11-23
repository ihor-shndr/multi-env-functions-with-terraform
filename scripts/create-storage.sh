APP_NAME=$1

RESOURCE_GROUP=tfstate-rg-$APP_NAME
STORAGE_ACCOUNT=tfstate$APP_NAME$RANDOM

if [ $(az group exists --name $RESOURCE_GROUP) = false ]; then
    # Create resource group
    az group create --name $RESOURCE_GROUP --location eastus

    # Create storage account
    az storage account create --resource-group $RESOURCE_GROUP --name $STORAGE_ACCOUNT --sku Standard_LRS --encryption-services blob
    
    # Create blob container
    az storage container create --name tfstate --account-name $STORAGE_ACCOUNT

    # Save storage account in GitHub
    gh variable set STORAGE_ACCOUNT --body $STORAGE_ACCOUNT

    echo $STORAGE_ACCOUNT
else
    echo "Resource group $RESOURCE_GROUP is already created"
fi