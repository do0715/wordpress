resource "aws_route_table_association" "doyun_puba_ass" {
  subnet_id      = aws_subnet.doyun_puba.id
  route_table_id = aws_route_table.doyun_pubrt.id
}

resource "aws_route_table_association" "doyun_pubc_ass" {
  subnet_id      = aws_subnet.doyun_pubc.id
  route_table_id = aws_route_table.doyun_pubrt.id
}