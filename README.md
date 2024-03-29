# AWS Elastic IP(EIP) Terraform Module

## Requeriments
EIP may require IGW to exist prior to association

## Official Documentation
- [Resource: aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)

## Example Usage

- Single EIP associated with an instance
    ```json
    resource "aws_eip" "lb" {
        instance = aws_instance.web.id
        vpc      = true
    }
    ```

- Multiple EIPs associated with a single network interface.
    ```json
        resource "aws_network_interface" "multi-ip" {
            subnet_id   = aws_subnet.main.id
            private_ips = ["10.0.0.10", "10.0.0.11"]
        }

        resource "aws_eip" "one" {
            vpc                       = true
            network_interface         = aws_network_interface.multi-ip.id
            associate_with_private_ip = "10.0.0.10"
        }

        resource "aws_eip" "two" {
            vpc                       = true
            network_interface         = aws_network_interface.multi-ip.id
            associate_with_private_ip = "10.0.0.11"
        }
    ```

- Attaching an EIP to an Instance with a pre-assigned private ip (VPC Only)
    ```json
        resource "aws_vpc" "default" {
            cidr_block           = "10.0.0.0/16"
            enable_dns_hostnames = true
        }

        resource "aws_internet_gateway" "gw" {
            vpc_id = aws_vpc.default.id
        }

        resource "aws_subnet" "tf_test_subnet" {
            vpc_id                  = aws_vpc.default.id
            cidr_block              = "10.0.0.0/24"
            map_public_ip_on_launch = true

            depends_on = [aws_internet_gateway.gw]
        }

        resource "aws_instance" "foo" {
            ami           = "ami-5189a661"
            instance_type = "t2.micro"

            private_ip = "10.0.0.12"
            subnet_id  = aws_subnet.tf_test_subnet.id
        }

        resource "aws_eip" "bar" {
            vpc = true

            instance                  = aws_instance.foo.id
            associate_with_private_ip = "10.0.0.12"
            depends_on                = [aws_internet_gateway.gw]
        }
    ```