output "security_groups" {
  value = values(aws_security_group.this)[*].id
}

output "subnets" {
  value = values(aws_subnet.this)[*].id
}
