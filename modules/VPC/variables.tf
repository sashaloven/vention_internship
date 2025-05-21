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
  })
}