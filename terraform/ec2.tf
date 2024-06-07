resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "5-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "aws_instance" "myec2" {
  count = var.number
  ami             = "ami-04b70fa74e45c3957"
  instance_type   = "t2.medium"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = ["5-sg"]

  tags = {
    Name = "5-${count.index}"
  }

  root_block_device {
    volume_size = var.stockage
  }
}
