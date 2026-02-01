# Primary VPC Internet Gateway (ap-south-1)
# - Attached to Primary VPC
# - Provides public internet access for the VPC
# - Depends on Primary VPC creation

resource "aws_internet_gateway" "primary_Ig" {
  vpc_id = aws_vpc.primary_vpc.id
  region = var.primary_region
  depends_on = [ aws_vpc.primary_vpc ]

  tags = {
    Name = local.primary_igw_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}

# Secondary VPC Internet Gateway (us-east-1)
# - Attached to Secondary VPC
# - Provides public internet access for the VPC
# - Depends on Secondary VPC creation

resource "aws_internet_gateway" "secondary_Ig" {
  vpc_id = aws_vpc.secondary_vpc.id
  region = var.secondary_region
  depends_on = [ aws_vpc.secondary_vpc ]

  tags = {
    Name = local.secondary_igw_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}
