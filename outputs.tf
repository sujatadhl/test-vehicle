output "current_subscription_subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
output "eventhub_authorization_rule" {
  value     = azurerm_eventhub_authorization_rule.authorization_rule.primary_connection_string
  sensitive = true
}
output "storage_account_access_key" {
  value     = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}