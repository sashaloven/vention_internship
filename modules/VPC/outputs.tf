output "vpc_id" {
    value = aws_vpc.this.id
}

output "egress_rules_obj" {
    value = local.egress_rules_obj
}

output "ingress_rules_obj" {
    value = local.ingress_rules_obj
}
