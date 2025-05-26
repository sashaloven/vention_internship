resource "aws_lb" "vention_alb" {
  name               = var.vention_alb.name
  internal           = var.vention_alb.internal
  load_balancer_type = var.vention_alb.load_balancer_type
  security_groups    = var.security_groups         
  subnets            = var.subnets

  enable_deletion_protection = var.vention_alb.enable_deletion_protection
    tags = {
    Name = var.vention_alb.name
  }
}

resource "aws_lb_target_group" "vention_tg" {
  for_each = var.vention_tg
  name     = each.value.name
  port     = var.vention_tg.port
  protocol = var.vention_tg.protocol
  
  vpc_id   = module.vention_vpc.vpc_id
}

resource "aws_lb_listener" "vention_listener" {
  load_balancer_arn = aws_lb.vention_alb.arn
  port              = var.vention_listener.port
  protocol          = var.vention_listener.protocol

  default_action {
    type             = var.vention_listener.default_action.type
    target_group_arn = aws_lb_target_group.vention_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "vention_attach_tg" {
  for_each = var.instance_ids
  target_group_arn = aws_lb_target_group.vention_tg.arn
  target_id        = each.value
}
