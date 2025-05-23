resource "aws_vpc" "this" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.name
    }
}

resource "aws_subnet" "this" {
    for_each = var.subnets
    cidr_block = each.value.cidr_block
    vpc_id = aws_vpc.this.id
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
    tags = {
      Name = each.key
    }
}

resource "aws_internet_gateway" "this" {
    count = var.internet_gateway.enabled ?1:0

    vpc_id = aws_vpc.this.id
    tags = {
      Name = var.internet_gateway.name
    }
}

resource "aws_route_table" "this" {
  count = var.internet_gateway.enabled ?1:0

  vpc_id = aws_vpc.this.id

   dynamic "route" {
    for_each = var.internet_gateway.route_cidrs
    
    content {
      cidr_block = route.value
      gateway_id = aws_internet_gateway.this[0].id
    }
  }
  tags = {
      Name = var.name
    }
}

resource "aws_security_group" "this" {
    for_each = var.secG
    name     = each.value.name
    vpc_id = aws_vpc.this.id
}

resource "aws_security_group_rule" "ingress" {
  for_each = local.ingress_rules_obj
  from_port         = each.value.from_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this[each.value.security_group_name].id
  to_port           = each.value.to_port
  type              = "ingress"
  cidr_blocks = each.value.cidr_blocks
  source_security_group_id = each.value.source_security_group_id
}

resource "aws_security_group_rule" "egress" {
  for_each = local.egress_rules_obj
  from_port         = each.value.from_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this[each.value.security_group_name].id
  to_port           = each.value.to_port
  type              = "egress"
  cidr_blocks = each.value.cidr_blocks
  source_security_group_id = each.value.source_security_group_id
}