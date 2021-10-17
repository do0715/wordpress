resource "aws_internet_gateway" "doyun_ig" {
  vpc_id = aws_vpc.doyun_vpc.id

  tags = {
    Name = "doyun-ig"
  }
}
/*
output "vpc-id" {
    value = aws_vpc.doyun_vpc.id  
}
*/