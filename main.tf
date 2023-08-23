resource "aws_eip" "eip" {
    domain= var.vpc
    instance = var.instance
    network_interface = var.network_interface
    associate_with_private_ip = var.associate_with_private_ip
    tags = var.tags

    public_ipv4_pool = var.public_ipv4_pool
}
