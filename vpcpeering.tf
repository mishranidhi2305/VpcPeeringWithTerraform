# Creating VPC peering request from Primary VPC to Secondary VPC

resource "aws_vpc_peering_connection" "primary_secondary" {
     provider = aws.primary
  vpc_id        = aws_vpc.primary_vpc.id
  peer_vpc_id   = aws_vpc.secondary_vpc.id
  peer_region   = var.secondary_region
  auto_accept   = false

  tags = {
    Name = local.primay_peering_name
    environment = var.environment
    Managed_By = var.managed_by
    side = "requester"
  }
}

# Accept peering connection from secondary region
resource "aws_vpc_peering_connection_accepter" "secondary_to_primary" {
  provider                  = aws.secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_secondary.id
  auto_accept               = true

  tags = {
    Name = local.secondary_peering_name
    environment = var.environment
    Managed_By = var.managed_by
    side = "accepter"
  }
}