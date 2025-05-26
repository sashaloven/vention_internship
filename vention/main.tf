module "vention_vpc" {
    source              = "../modules/VPC"
    name                = var.name
    cidr_block          = var.cidr_block
    subnets             = var.subnets
    internet_gateway    = var.internet_gateway
    secG                = var.secG
}

module "vention_ec2" {
  source             = "../modules/EC2"
  ami_config         = var.ami_config
  ec2_instances      = var.ec2_instances
  vpc_id             = module.vention_vpc.vpc_id
  subnet_ids         = module.vention_vpc.subnet_ids
  security_group_ids = module.vention_vpc.security_group_ids
}

module "vention_alb" {
  source              = "../modules/ALB"
  vention_alb         = var.vention_alb
  vention_tg          = var.vention_tg
  vention_listener    = var.vention_listener
  instance_ids        = module.vention_ec2.instance_ids
  security_groups     = var.security_groups
  subnets             = var.subnets
}