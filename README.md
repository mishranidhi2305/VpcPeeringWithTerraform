# 🌐 Terraform VPC Peering (Multi-Region AWS)

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900)
![VPC](https://img.shields.io/badge/Networking-VPC%20Peering-blue)
![Status](https://img.shields.io/badge/Status-Active-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

This repository demonstrates how to create **VPC Peering between two AWS VPCs in different regions using Terraform**, along with EC2 instances to validate **private connectivity**, following **Infrastructure as Code (IaC)** best practices.

The configuration uses **multiple AWS provider aliases** to deploy infrastructure in **ap-south-1** & **us-east-1**.

---

## 🏗 Architecture Overview

```bash
+---------------------------+        VPC Peering        +---------------------------+
|        Primary VPC        | <---------------------> |       Secondary VPC       |
|        ap-south-1         |                         |        us-east-1           |
|                           |                         |                           |
|   EC2 Instance            |                         |   EC2 Instance            |
|   Public / Private Subnet |                         |   Public / Private Subnet |
+---------------------------+                         +---------------------------+
           |                                                     |
           |------------------ Internet Gateway ----------------|

Architecture Summary:

Primary VPC → ap-south-1
Secondary VPC → us-east-1
One public subnet in each VPC
Internet Gateway attached to both VPCs
VPC Peering connection between both VPCs
Route tables allow inter-VPC communication
EC2 instance launched in each VPC
Security Groups allow SSH + ICMP + inter-VPC traffic

📁 Project Structure
vpc-peering-terraform/
│
├── provider.tf          # Multi-region AWS providers
├── variables.tf         # Input variables
├── locals.tf            # Naming conventions
├── datasource.tf        # AMI, AZs, Key pairs
│
├── vpc.tf               # VPC creation
├── subnet.tf            # Subnet configuration
├── internetgateway.tf   # Internet Gateway setup
├── routetable.tf        # Route tables & peering routes
├── sg.tf                # Security group rules
├── vpcpeering.tf        # Peering request & acceptance
├── ec2.tf               # EC2 instances
│
├── outputs.tf           # Output values
└── README.md            # Project documentation

⚙️ Prerequisites

Terraform ≥ 1.3
AWS Account
AWS CLI configured
Existing EC2 key pairs in both regions

🚀 How to Deploy
terraform init
terraform validate
terraform plan
terraform apply --auto-approve

📚 Learning Outcomes

Multi-region Terraform setup
AWS VPC Peering implementation
Route table & security group configuration
Private vs public traffic behavior

---

🔗 Repository

👉 https://github.com/mishranidhi2305/VpcPeeringWithTerraform

---

🙌 Author

Nidhi Mishra
Cloud & DevOps Engineer

This project is actively maintained and continuously improved to support the DevOps community in learning, building, and scaling cloud infrastructure.

Happy Terraforming 🚀
