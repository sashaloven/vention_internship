output "vpc_id" {
    value = module.vention_vpc.vpc_id
}

output "egress_rules_obj" {
    value = module.vention_vpc.egress_rules_obj
}

output "ingress_rules_obj" {
    value = module.vention_vpc.ingress_rules_obj
}
