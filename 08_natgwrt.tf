resource "aws_route_table" "doyun_natrt_pria" {
  vpc_id = aws_vpc.doyun_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.doyun_ngw_pria.id
  }

  tags = {
    Name = "doyun-natrt-pria"
  }
}

resource "aws_route_table" "doyun_natrt_pric" {
  vpc_id = aws_vpc.doyun_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.doyun_ngw_pric.id
  }

  tags = {
    Name = "doyun-natrt-pric"
    }
}