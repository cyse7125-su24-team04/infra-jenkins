variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
}

variable "ami_id" {
  description = "ID of the AMI to use for the instance"
}

variable "existing_eip_id" {
  description = "ID of the existing Elastic IP"
}
variable "instance_type" {
  description = "Instance type"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress traffic"
  type        = list(string)
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
}

variable "ingress_ports" {
  description = "Ports for ingress traffic"
  type        = number
}
variable "egress_ports" {
  description = "Ports for egress traffic"
  type        = number
}

variable "egress_protocol" {
  description = "egress protocol"
  type        = number
}
variable "ingress_protocol" {
  description = "ingress protocol"
}
variable "destination_cidr_block" {
  description = "Destination CIDR block"
}

