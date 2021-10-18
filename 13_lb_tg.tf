resource "aws_lb_target_group" "doyun_lb_tg" {
  name        = "doyun-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.doyun_vpc.id

health_check {
        enabled             = true
        healthy_threshold   = 3
        interval            = 5
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 2
        unhealthy_threshold = 2
    }
}