resource "aws_eip" "lb" {
  count = var.number
  instance = aws_instance.myec2[count.index].id
  domain   = "vpc"
}