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