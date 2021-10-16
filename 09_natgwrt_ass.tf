resource "aws_route_table_association" "doyun_pria_ass" {
  subnet_id      = aws_subnet.doyun_pria.id
  route_table_id = aws_route_table.doyun_natrt_pria.id
}

resource "aws_route_table_association" "doyun_pric_ass" {
  subnet_id      = aws_subnet.doyun_pric.id
  route_table_id = aws_route_table.doyun_natrt_pric.id
}