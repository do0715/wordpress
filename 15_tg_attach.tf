data "aws_instances" "test" {
  instance_tags = {
    Name = "web*"
  }
}

resource "aws_lb_target_group_attachment" "doyun_lb_tg_ass" {
  target_group_arn = aws_lb_target_group.doyun_lb_tg.arn
  target_id        = data.aws_instances.test.private_ips[0]
  port             = 80
}
