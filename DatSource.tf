
# Fetch all available Availability Zones in the primary region (ap-south-1)
data "aws_availability_zones" "primary_AZ" {
  provider = aws.primary
  state    = "available"
}

# Fetch all available Availability Zones in the secondary region (us-east-1)
data "aws_availability_zones" "secondary_AZ" {
  provider = aws.secondary
  state    = "available"
}

# Fetch the latest Ubuntu 22.04 LTS AMI for Primary VPC (ap-south-1)
data "aws_ami" "ubuntu_primary" {
  provider    = aws.primary
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Fetch the latest Ubuntu 22.04 LTS AMI for Secondary VPC (us-east-1)
data "aws_ami" "ubuntu_secondary" {
  provider    = aws.secondary
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
# Fetch existing SSH key pair in Primary region (ap-south-1)
data "aws_key_pair" "primary_key" {
  provider = aws.primary
  key_name = var.primary_key_name
}

# Fetch existing SSH key pair in Secondary region (us-east-1)
data "aws_key_pair" "secondary_key" {
  provider = aws.secondary
  key_name = var.secondary_key_name
}
