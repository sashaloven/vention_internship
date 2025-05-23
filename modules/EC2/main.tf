data "aws_ami" "ubuntu" {
  most_recent = var.ami_config.most_recent
  owners      = var.ami_config.owners

  dynamic "filter" {
    for_each = var.ami_config.filters
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

resource "aws_instance" "vention_ec2" {
  for_each = var.ec2_instances

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = each.value.instance_type
  subnet_id              = var.subnet_ids[each.value.subnet_name]
  vpc_security_group_ids = [for name in each.value.sg_names : var.security_group_ids[name]]



  tags = {
    Name = each.key
  }
}

