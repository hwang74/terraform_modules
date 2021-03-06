resource "azurerm_app_service_plan" "current" {
    lifecycle {
        ignore_changes           = [ 
            tags, 
        ]
    }
    kind                         = var.kind
    location                     = var.location
    maximum_elastic_worker_count = var.maximum_elastic_worker_count
    name                         = var.name
    per_site_scaling             = var.per_site_scaling
    reserved                     = var.kind == "Linux" || var.kind == "linux" ? true : false
    resource_group_name          = var.resource_group_name
    tags                         = var.tags
    zone_redundant               = var.zone_redundant

    sku {
        capacity = var.sku.capacity
        size     = var.sku.size
        tier     = var.sku.tier
    }
}

