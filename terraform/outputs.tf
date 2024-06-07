output "addresses-public" {
  value = [aws_eip.lb.*.public_ip]
}

output "private_key" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}
