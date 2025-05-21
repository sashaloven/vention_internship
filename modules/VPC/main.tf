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