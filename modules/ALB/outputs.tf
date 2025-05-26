output "security_groups" {
  value = values(module.vention_vpc.aws_security_group.this)[*].id
}

output "subnets" {
  value = values(module.vention_vpc.aws_subnet.this)[*].id
}
