locals {
  # Primary region resource names
  primary_vpc_name        = "primary-vpc-${var.name}-${var.environment}"
  primary_subnet_name     = "primary-subnet-${var.name}-${var.environment}"
  primary_routetable_name = "primary-route-table-${var.name}-${var.environment}"
  primary_igw_name        = "primary-igw-${var.name}-${var.environment}"
  primay_peering_name     = "primary-peering-${var.name}-${var.environment}"
  primary_sg_tag          = "primary-sg-${var.name}-${var.environment}"
  primary_ec2_tag          = "primary-ec2-${var.name}-${var.environment}"

  # Secondary region resource names
  secondary_vpc_name        = "secondary-vpc-${var.name}-${var.environment}"
  secondary_subnet_name     = "secondary-subnet-${var.name}-${var.environment}"
  secondary_routetable_name = "secondary-route-table-${var.name}-${var.environment}"
  secondary_igw_name        = "secondary-igw-${var.name}-${var.environment}"
  secondary_peering_name     = "secondary-peering-${var.name}-${var.environment}"
  secondary_sg_tag          = "secondary-sg-${var.name}-${var.environment}"
 secondary_ec2_tag          = "secondary-ec2-${var.name}-${var.environment}"
}


