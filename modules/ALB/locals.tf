locals {
  instance_ids = toset(module.ec2.instance_ids)
}