resource "aws_eip" "doyun_eip_puba" {
 #instance = aws_instance.web.id
  vpc      = true
}
resource "aws_eip" "doyun_eip_pubc" {
 #instance = aws_instance.web.id
  vpc      = true
}


resource "aws_nat_gateway" "doyun_ngw_pria" {
  allocation_id = aws_eip.doyun_eip_puba.id
  subnet_id     = aws_subnet.doyun_puba.id

  tags = {
    Name = "doyun-ngw-pria"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.example]
}

resource "aws_nat_gateway" "doyun_ngw_pric" {
  allocation_id = aws_eip.doyun_eip_pubc.id
  subnet_id     = aws_subnet.doyun_pubc.id

  tags = {
    Name = "doyun-ngw-pric"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.example]
}