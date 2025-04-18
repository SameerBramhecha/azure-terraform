module "resource-group"{
    source = "./resource-group"
}

module "storage-account"{
    source = "./storage-account"
    location = module.resource-group.location
    resource_group_name     = module.resource-group.name
}