/*
resource "aws_network_interface" "pub_a" {
  subnet_id   = aws_subnet.pub_a.id
  private_ips = ["10.0.0.11"]

  tags = {
    Name = "pri_net_int"
  }
}
*/
resource "aws_instance" "web_1" {
  ami           = "ami-0e4a9ad2eb120e054"
  instance_type = "t2.micro"
  key_name = "tf-key2"
  vpc_security_group_ids = [aws_security_group.doyun_allow_http.id]
  availability_zone = "ap-northeast-2a"
  private_ip = "192.168.0.11"
  subnet_id = aws_subnet.doyun_puba.id
  user_data =<<-eof
                #!/bin/bash
                sudo su -
                yum install -y httpd
                cat > /var/www/html/index.html << end
                <html><body><h1>Terraform-WEB-1</h1></body></html>
                end
                systemctl start httpd
                eof
                
  #user_data = file("install1.sh")

  tags = {
    Name = "web-1"
  }
  
  root_block_device {
    volume_size = 30
  }
/*
  network_interface {
    network_interface_id = aws_network_interface.pub_a.id
    device_index         = 0
  }
*/
  credit_specification {
    cpu_credits = "unlimited"
  }
}
resource "aws_eip" "web_1" {
  vpc = true

  instance       = aws_instance.web_1.id
  associate_with_private_ip = "192.168.0.11"
  #depends_on                =  [aws_internet_gateway.ig]
}
