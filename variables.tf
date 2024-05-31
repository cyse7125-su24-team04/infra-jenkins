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

variable "ingress_port_http" {
  description = "Port for http ingress traffic"
  type        = number
}
variable "ingress_port_https" {
  description = "Port for https ingress traffic"
  type        = number
}
variable "ingress_port_ssh" {
  description = "Port for ssh ingress traffic"
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

variable "jenkins_sg_name" {
  description = "Name of the security group for Jenkins instance"
  default     = "jenkins-security-group"
}

variable "jenkins_sg_description" {
  description = "Description of the security group for Jenkins instance"
  default     = "Security group for Jenkins instance"
}


variable "jenkins_instance_tag" {
  description = "Tag for the Jenkins instance"
  default     = "jenkins-instance"
}
