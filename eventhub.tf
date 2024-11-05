resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                = "${var.app_name}-eventhub-namespace"
  location            = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  sku                 = "Standard"
  capacity            = 1
}
resource "azurerm_eventhub" "eventhub" {
  name                = "${var.app_name}-eventhub"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  partition_count     = 2
  message_retention   = 1
  capture_description {
    enabled             = true
    encoding            = "Avro"
    interval_in_seconds = 60
    destination {
      name                = "EventHubArchive.AzureBlockBlob"
      archive_name_format = " {Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
      blob_container_name = azurerm_storage_container.container.name
      storage_account_id  = azurerm_storage_account.storage_account.id
    }
  }
}
resource "azurerm_eventhub_authorization_rule" "authorization_rule" {
  name                = "${var.app_name}-authorization-rule"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  manage              = true
  listen              = true
  send                = true
}