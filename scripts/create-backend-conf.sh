APP_NAME=$1
ENV=$2
STORAGE_ACCOUNT=$3

echo "APP_NAME: $APP_NAME"
echo "ENV: $ENV"
echo "STORAGE_ACCOUNT: $STORAGE_ACCOUNT"

RESOURCE_GROUP=tfstate-rg-$APP_NAME
CONTAINER_KEY="${APP_NAME}.${ENV}"

target_directory="../terraform/backend.conf"



echo "storage_account_name = \"$STORAGE_ACCOUNT\"" > "$target_directory"
echo "resource_group_name  = \"$RESOURCE_GROUP\"" >> "$target_directory"
echo "key       = \"$CONTAINER_KEY\"" >> "$target_directory"

echo "backend.conf file has been created successfully."