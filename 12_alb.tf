resource "aws_lb" "doyun_lb" {
  name               = "doyun-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.doyun_allow_http.id]
  subnets            = [aws_subnet.doyun_puba.id,aws_subnet.doyun_pubc.id]
/*
  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/
  tags = {
    Environment = "production"
  }
}