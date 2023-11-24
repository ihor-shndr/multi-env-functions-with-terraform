APP_NAME=$1
ENV=$2
STORAGE_ACCOUNT=$3

RESOURCE_GROUP=tfstate-rg-$APP_NAME
CONTAINER_KEY="${APP_NAME}.${ENV}"

target_directory="../terraform/backend.conf"



echo "storage_account_name = \"$STORAGE_ACCOUNT\"" > "$target_directory"
echo "resource_group_name  = \"$RESOURCE_GROUP\"" >> "$target_directory"
echo "key       = \"$CONTAINER_KEY\"" >> "$target_directory"

echo "backend.conf file has been created successfully."