# Jenkins Deployment on AWS with Terraform

This Terraform project provisions the infrastructure required to deploy a Jenkins server on AWS.

## Prerequisites

Before you begin, ensure you have the following:

- **AWS Account**: You need an active AWS account to provision the infrastructure.
- **Terraform**: Install Terraform on your local machine. [Installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **AWS CLI** (optional): For managing your AWS environment, though not required for this project.
- **AWS Access Key and Secret Key**: To authenticate Terraform with your AWS account.
- **Let’s Encrypt/Certbot**: This is set up automatically within the EC2 instance for SSL.

## Installation

**Clone the repository:**

```bash
git clone git@github.com:cyse7125-su24-team04/infra-jenkins.git
cd infra-jenkins
```


## Usage
Set Up Variables: Update the terraform.tfvars file or set the environment variables as described in the Prerequisites section.

**1.Initialize Terraform:**

```bash
terraform init
```

**2.Validate Terraform:**

```bash
terraform validate
```

**3.Plan Terraform:**

```bash
terraform plan
```



**4.Apply the Configuration:**

Review the changes and confirm to deploy the resources.

```bash
terraform apply
```

## clean up

To destroy the infrastructure:

```bash
terraform destroy
```

## Features

- **VPC Creation**: Creates a VPC to host the Jenkins infrastructure.
- **Subnet**: Provisions a public subnet within the VPC.
- **Internet Gateway**: Attaches an internet gateway to allow internet access.
- **Route Table**: Configures route tables for the subnet.
- **Security Group**: Defines security group rules for HTTP, HTTPS, and SSH access.
- **EC2 Instance**: Launches an EC2 instance with Jenkins pre-installed and configures it to use an existing Elastic IP.
- **EIP Association**: Associates an existing Elastic IP with the EC2 instance.
- **SSL with Let's Encrypt**: The EC2 instance automatically sets up SSL certificates using Let's Encrypt via certbot.


## Configuration
You can configure the infrastructure by modifying the variables.tf file or passing variables directly during the Terraform apply command.

