variable "client_id" {
    description = "The client ID of the service principal used to authenticate with Azure."
    type        = string
}
variable "client_secret" {
    description = "The client secret of the service principal used to authenticate with Azure."
    type        = string
}
variable "subscription_id" {
    description = "The subscription ID of the Azure subscription to use."
    type        = string
}
variable "tenant_id" {
    description = "The tenant ID of the Azure Active Directory to use."
    type        = string
}