resource "aws_ami_from_instance" "doyun_web_id" {
  name               = "tf-web-image"
  source_instance_id = aws_instance.web_1.id
}