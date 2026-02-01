# - Primary VPC (ap-south-1)
# - CIDR block from variable: var.primary_cidr_block

resource "aws_vpc" "primary_vpc" {
  cidr_block       = var.primary_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnamee
  enable_dns_support   = var.enable_dns_supports
  provider = aws.primary
  
   tags = {
    Name = local.primary_vpc_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}
# Secondary VPC (us-east-1)
# - CIDR block from variable: var.secondary_cidr_block

resource "aws_vpc" "secondary_vpc" {
  cidr_block       = var.secondary_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnamee
  enable_dns_support   = var.enable_dns_supports
  provider = aws.secondary

  tags = {
    Name = local.secondary_vpc_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}
