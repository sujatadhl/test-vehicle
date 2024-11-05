resource "azurerm_signalr_service" "signalr" {
  name = "${var.app_name}-signalr"
  location = azurerm_resource_group.adex_suite_rtvt_rg.location
  resource_group_name = azurerm_resource_group.adex_suite_rtvt_rg.name
  sku {
    name = "Free_F1"
    capacity = 1
    }
    public_network_access_enabled =  true
    connectivity_logs_enabled = false
    messaging_logs_enabled = true
    service_mode = "Default"
    upstream_endpoint {
      category_pattern = ["connections","messages"]
      event_pattern = ["*"]
      hub_pattern = ["hub1"]
      url_template = "http://test.com"
    }
}