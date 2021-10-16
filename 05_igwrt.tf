resource "aws_route_table" "doyun_pubrt" {
  vpc_id = aws_vpc.doyun_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.doyun_ig.id
  }

  tags = {
    Name = "doyun-pubrt"
  }
}