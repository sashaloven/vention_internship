output "vpc_id" {
    value = aws_vpc.this.id
}

output "egress_rules_obj" {
    value = local.egress_rules_obj
}

output "ingress_rules_obj" {
    value = local.ingress_rules_obj
}

output "subnet_ids" {
  value = { for k, subnet in aws_subnet.this : k => subnet.id }
}

output "security_group_ids" {
  value = { for k, sg in aws_security_group.this : k => sg.id }
}

