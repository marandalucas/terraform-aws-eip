output "id" {
  value = aws_eip.eip.id
}

output "private_ip" {
  value = aws_eip.eip.private_ip
}

output "private_dns" {
  value = aws_eip.eip.private_dns
}

output "associate_with_private_ip" {
  value = aws_eip.eip.associate_with_private_ip
}

output "public_ip" {
  value = aws_eip.eip.public_ip
}

output "public_dns" {
  value = aws_eip.eip.public_dns
}

output "instance" {
  value = aws_eip.eip.instance
}

output "network_interface" {
  value = aws_eip.eip.network_interface
}

output "public_ipv4_pool" {
  value = aws_eip.eip.public_ipv4_pool
}