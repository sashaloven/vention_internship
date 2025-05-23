module "vention_vpc" {
    source = "../modules/VPC"
    name = var.name
    cidr_block = var.cidr_block
    subnets = var.subnets
    internet_gateway = var.internet_gateway
    secG = var.secG
}