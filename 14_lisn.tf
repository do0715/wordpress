resource "aws_lb_listener" "doyun_lb_front" {
  load_balancer_arn = aws_lb.doyun_lb.arn
  port              = "80"
  protocol          = "HTTP"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #alpn_policy       = "HTTP2Preferred"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.doyun_lb_tg.arn
  }
}