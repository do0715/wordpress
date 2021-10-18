resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform-lc-example-"
  image_id      = aws_ami_from_instance.doyun_web_id.id
  instance_type = "t2.micro"
  iam_instance_profile  =   "admin_role"
  security_groups   =   [aws_security_group.doyun_allow_http.id]
  key_name          =   "tf-key2"
  #user_data         =   file("install.sh")
  user_data =<<-eof
                #!/bin/bash
                systemctl restart httpd
                systemctl enable  httpd
                eof

  lifecycle {
    create_before_destroy = true
  }
}
