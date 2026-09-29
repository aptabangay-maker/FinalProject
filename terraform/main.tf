terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "devops_app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y openjdk-17-jre-headless
              echo "You completed DevOps bootcamp Batch 17!" > /home/ubuntu/app_output.txt
              EOF

  tags = {
    Name = "DevOps-FinalProject-Server"
  }
}

output "instance_id" {
  value = aws_instance.devops_app_server.id
}

output "public_ip" {
  value = aws_instance.devops_app_server.public_ip
}
