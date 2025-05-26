variable "name" { 
    type = string
}

variable "cidr_block" {
    type = string
}

variable "subnets" {
    type = map(object({
        availability_zone = string
        cidr_block = string
        map_public_ip_on_launch = bool
    }))
}

variable "internet_gateway" {
  type = object({
    name = optional(string, null)
    enabled = optional(bool, true)
    route_cidrs = optional(list(string), [])

  })
}

variable "secG" {
  description = "map of sg rules"
  type = map(object({
    name = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = optional(list(string), null)
      source_security_group_id = optional(string, null)
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = optional(list(string), null)
      source_security_group_id = optional(string, null)
    }))
  }))
}

variable "ami_config" {
  type = object({
    most_recent = bool
    owners      = list(string)
    filters     = list(object({
      name   = string
      values = list(string)
    }))
  })
}

variable "ec2_instances" {
  type = map(object({
    instance_type = string
    subnet_name   = string
    sg_names      = list(string)
  }))
}

variable "vention_alb" {
  type = object({
    name = string
    internal = bool
    load_balancer_type = string
    security_groups = list(string)
    subnets = list(string)
    enable_deletion_protection = bool
  })
}

variable "vention_tg" {
  type = object({
    name = string
    port = number
    protocol = string
  })
}

variable "vention_listener" {
  type = map(object({
    port = optional(number)
    protocol = optional(string)
    default_action = list(object({
      type = string
    }))
  }))
}


