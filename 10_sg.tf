resource "aws_security_group" "doyun_allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.doyun_vpc.id

  ingress = [
    {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      #cidr_blocks      = [aws_vpc.doyun_vpc.cidr_block]
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   =   null
      prefix_list_ids   =   null
      self              =   null   
    },
    {
      description      = "ssh from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      #cidr_blocks      = [aws_vpc.doyun_vpc.cidr_block]
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   =   null
      prefix_list_ids   =   null
      self              =   null    
    }
  ]
/*
egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   =   null
      prefix_list_ids   =   null
      self              =   null    
      description       =   null
    }
  ]
*/
  tags = {
    Name = "doyun-allow-httpd-ssh"
  }
}