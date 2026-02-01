🌐 Terraform VPC Peering (Multi-Region)

This project demonstrates how to create VPC Peering between two VPCs in different AWS regions using Terraform, along with EC2 instances to validate private connectivity.

📌 Architecture Overview

Primary VPC → ap-south-1

Secondary VPC → us-east-1

One public subnet in each VPC

Internet Gateway attached to both VPCs

VPC Peering connection between both VPCs

Route tables updated to allow inter-VPC communication

EC2 instance launched in each VPC

Security Groups allow SSH + ICMP + inter-VPC traffic

🔁 Connectivity

✅ Private IP ↔ Private IP → Works

❌ Public IP ↔ Public IP → Does NOT work (expected AWS behavior)

🧩 Folder Structure
vpc-peering-terraform/
│
├── provider.tf            # AWS providers (primary & secondary regions)
├── variables.tf           # Input variables
├── locals.tf              # Resource naming conventions
├── Datasource.tf          # AMI, AZs, key pairs
├── vpc.tf                 # VPC creation
├── subnet.tf              # Subnets
├── internetGateway.tf     # Internet Gateways
├── routetable.tf          # Route tables & peering routes
├── sg.tf                  # Security Groups
├── vpcpeering.tf          # VPC peering (requester & accepter)
├── ec2.tf                 # EC2 instances
├── outputs.tf             # Output values
└── README.md              # Documentation

⚙️ Prerequisites

Terraform ≥ 1.3

AWS account

AWS CLI configured

Existing EC2 key pairs in both regions

aws configure

🔐 Key Pair Requirement

Make sure these key pairs already exist:

Region	Variable Name
ap-south-1	primary_key
us-east-1	secondary_key

You can change names in variables.tf if needed.

🚀 How to Deploy
1️⃣ Initialize Terraform
terraform init

2️⃣ Validate configuration
terraform validate

3️⃣ Review the plan
terraform plan

4️⃣ Apply infrastructure
terraform apply --auto-approve


🔍 How VPC Peering Works Here

Primary VPC sends peering request

Secondary VPC accepts the request

Routes are added:

Primary → Secondary CIDR

Secondary → Primary CIDR

Security Groups allow inter-VPC traffic

🧪 Connectivity Testing
✅ Correct way to test peering

From EC2 in Primary VPC:

ping <PRIVATE-IP-of-Secondary-EC2>


From EC2 in Secondary VPC:

ping <PRIVATE-IP-of-Primary-EC2>


✔ This confirms:

Peering is active

Routes are correct

Security groups are working

❌ Why Public IP Ping Does NOT Work

This is expected AWS behavior, not a bug.

Reason:

VPC Peering does not support routing traffic via Internet Gateway (IGW).

Public IP traffic goes through:

IGW → Public Internet → IGW


AWS blocks edge-to-edge routing, so:

❌ Public IP → Public IP across VPCs
✅ Private IP → Private IP across VPCs

📌 AWS rule:

VPC Peering supports only private IP communication.

📤 Outputs

After deployment, Terraform will output:

VPC IDs

EC2 private IPs

VPC peering connection ID

These can be used for verification and debugging.

🧹 Cleanup

To destroy all resources:

terraform destroy --auto-approve

📚 Learnings from this Project

Multi-region Terraform providers

VPC peering lifecycle

Route table configuration

Security group design

Real AWS networking behavior (IGW vs Peering)

✨ Future Enhancements

Convert into reusable Terraform modules

Add NAT Gateway scenario

Add Bastion Host

Add diagram using Draw.io

Add CI/CD with GitHub Actions
