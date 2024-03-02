# Create a subnet within the virtual network
resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
resource_group_name = azurerm_resource_group.aks_rg.name
}