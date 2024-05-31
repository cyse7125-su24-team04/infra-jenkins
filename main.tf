provider "aws" {
  # version    = "~> 2.0"
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "jenkins_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "jenkins_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = var.subnet_cidr_block
}

resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
}

resource "aws_route_table" "jenkins_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.jenkins_route_table.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.jenkins_igw.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_route_table.id
}

resource "aws_security_group" "jenkins_sg" {
  name        = var.jenkins_sg_name
  description = var.jenkins_sg_description
  vpc_id      = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = var.ingress_port_http   # 80
    to_port     = var.ingress_port_http   # 80 
    protocol    = var.ingress_protocol    # "tcp"
    cidr_blocks = var.ingress_cidr_blocks # ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.ingress_port_https  # 443
    to_port     = var.ingress_port_https  # 443
    protocol    = var.ingress_protocol    # "tcp"
    cidr_blocks = var.ingress_cidr_blocks # ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.ingress_port_ssh    # 22
    to_port     = var.ingress_port_ssh    # 22
    protocol    = var.ingress_protocol    # "tcp"
    cidr_blocks = var.ingress_cidr_blocks # ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.egress_ports
    to_port     = var.egress_ports
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }
}

resource "aws_instance" "jenkins_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.jenkins_subnet.id
  security_groups             = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true
  user_data                   = <<-EOF
    #!/bin/bash
    sudo certbot --nginx -d jenkins.csye6225cloud.me --register-unsafely-without-email --agree-tos --test-cert
  EOF

  tags = {
    Name = var.jenkins_instance_tag
  }
}

data "aws_eip" "existing_eip" {
  id = var.existing_eip_id
}

resource "aws_eip_association" "jenkins_eip_association" {
  instance_id   = aws_instance.jenkins_instance.id
  allocation_id = data.aws_eip.existing_eip.id
}


output "instance_public_ip" {
  value = aws_instance.jenkins_instance.public_ip
}

output "eip" {
  value = data.aws_eip.existing_eip.public_ip
}


