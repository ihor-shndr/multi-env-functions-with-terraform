resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "functions_rg" {
  name     = "rg-${var.app_name}-${var.env}"
  location = var.azure_region
}

# resource "azurerm_cosmosdb_account" "db_account" {
#   name                = "db-account-${var.env}-${random_string.random.id}"
#   location            = azurerm_resource_group.functions_rg.location
#   resource_group_name = azurerm_resource_group.functions_rg.name
#   offer_type          = "Standard"
#   kind                = "MongoDB"

#   enable_automatic_failover = true

#   capabilities {
#     name = "EnableAggregationPipeline"
#   }

#   capabilities {
#     name = "mongoEnableDocLevelTTL"
#   }

#   capabilities {
#     name = "MongoDBv3.4"
#   }

#   capabilities {
#     name = "EnableMongo"
#   }

#   consistency_policy {
#     consistency_level       = "BoundedStaleness"
#     max_interval_in_seconds = 300
#     max_staleness_prefix    = 100000
#   }

#   geo_location {
#     location          = "eastus"
#     failover_priority = 1
#   }

#   geo_location {
#     location          = "westus"
#     failover_priority = 0
#   }
# }


# resource "azurerm_cosmosdb_mongo_database" "mongo_db" {
#   name                = "cosmos-mongo-db-${var.env}"
#   resource_group_name = azurerm_resource_group.functions_rg.name
#   account_name        = azurerm_cosmosdb_account.db_account.name
#   throughput          = 400
# }

# locals {
#   func_settings = {
#     connection_string = azurerm_cosmosdb_account.db_account.primary_mongodb_connection_string
#   }
# }

resource "azurerm_service_plan" "functions_sp" {
   #checkov:skip=CKV_AZURE_225:No need to make zone-redundant
  name                = "sp-${var.app_name}"
  location            = azurerm_resource_group.functions_rg.location
  resource_group_name = azurerm_resource_group.functions_rg.name

  os_type      = "Linux"
  sku_name     = "Y1"
  worker_count = 2
}

resource "azurerm_storage_account" "functions_sa" {
  name                            = "storage${var.env}${random_string.random.id}"
  resource_group_name             = azurerm_resource_group.functions_rg.name
  location                        = azurerm_resource_group.functions_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  min_tls_version                 = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
}

resource "azurerm_linux_function_app" "function_app" {
  name                          = "func-${var.app_name}"
  location                      = azurerm_resource_group.functions_rg.location
  resource_group_name           = azurerm_resource_group.functions_rg.name
  service_plan_id               = azurerm_service_plan.functions_sp.id
  storage_account_name          = azurerm_storage_account.functions_sa.name
  storage_account_access_key    = azurerm_storage_account.functions_sa.primary_access_key
  https_only                    = true
  public_network_access_enabled = false

  # app_settings = local.func_settings

  site_config {
    cors {
      allowed_origins = ["*"]
    }
    application_stack {
      node_version = 18
    }
  }
}

# output "cosmosdb_connectionstrings" {
#   value     = azurerm_cosmosdb_account.db_account.primary_mongodb_connection_string
#   sensitive = true
# }
