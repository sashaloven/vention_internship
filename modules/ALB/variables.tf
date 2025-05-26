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

variable "instance_ids" {
  type = set(string)
}


variable "security_groups" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
}




