# - Primary VPC Subnet
# - Public subnet in Primary VPC (ap-south-1)
# - Uses first available AZ from data source
# - Auto-assigns public IPs to instance

resource "aws_subnet" "primary_subnet" {
    provider = aws.primary
  vpc_id     = aws_vpc.primary_vpc.id
  cidr_block = var.primarySubnet_cidr_block
  availability_zone = data.aws_availability_zones.primary_AZ.names[0]
    map_public_ip_on_launch = true

  tags = {
    Name = local.primary_subnet_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}

# Secondary VPC Subnet
# - Public subnet in Secondary VPC (us-east-1)
# - Uses first available AZ from data source
# - Auto-assigns public IPs to instances

resource "aws_subnet" "secondary_subnet" {
    provider = aws.secondary
  vpc_id     = aws_vpc.secondary_vpc.id
  cidr_block = var.secondarySubnet_cidr_block
  availability_zone = data.aws_availability_zones.secondary_AZ.names[0]
  map_public_ip_on_launch = true

   tags = {
    Name = local.secondary_subnet_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}
