# Create an AKS cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.1.10"
    service_cidr   = "10.0.1.0/24"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku = "standard"
  }

  service_principal {
    client_id     = "<service_principal_client_id>"
    client_secret = "<service_principal_client_secret>"
  }

  tags = {
    Environment = "Production"
  }
}