resource "aws_subnet" "doyun_puba" {
  vpc_id     = aws_vpc.doyun_vpc.id
  cidr_block = "192.168.0.0/24"
  availability_zone =   "ap-northeast-2a"
  tags = {
    Name = "pub-a"
  }
}

resource "aws_subnet" "doyun_pubc" {
  vpc_id     = aws_vpc.doyun_vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone =   "ap-northeast-2c"
  tags = {
    Name = "pub-c"
  }
}

resource "aws_subnet" "doyun_pria" {
  vpc_id     = aws_vpc.doyun_vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone =   "ap-northeast-2a"
  tags = {
    Name = "pri-a"
  }
}

resource "aws_subnet" "doyun_pric" {
  vpc_id     = aws_vpc.doyun_vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone =   "ap-northeast-2c"
  tags = {
    Name = "pri-c"
  }
}