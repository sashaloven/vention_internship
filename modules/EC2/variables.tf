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


variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = map(string)
}

variable "security_group_ids" {
  type = map(string)
}


