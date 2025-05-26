output "instance_ids" {
  value = [for instance in aws_instance.vention_ec2 : instance.id]
}
