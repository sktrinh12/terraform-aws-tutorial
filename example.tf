 terraform {
  backend "remote" {
    organization = "trinhsk"

    workspaces {
      name = "tf-example"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
	region = var.region
  # region  = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"

	provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
	vpc = true
  instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}

output "ip" {
	value = aws_eip.ip.public_ip
}
