resource "aws_placement_group" "doyun_pg" {
  name     = "doyun-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "doyun_at_sg" {
  name                      = "doyun-at-sg"
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  #placement_group           = aws_placement_group.doyun_pg.id
  launch_configuration      = aws_launch_configuration.as_conf.name
  vpc_zone_identifier       = [aws_subnet.doyun_puba.id, aws_subnet.doyun_pubc.id]
}