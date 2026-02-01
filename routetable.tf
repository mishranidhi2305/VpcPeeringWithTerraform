# Primary VPC Route Table, Routes 0.0.0.0/0 traffic to Internet Gateway

resource "aws_route_table" "primary_routetable" {
provider = aws.primary
  vpc_id = aws_vpc.primary_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary_Ig.id
  }

  tags = {
    Name = local.primary_routetable_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}

# Secondary VPC Route Table,  Routes 0.0.0.0/0 traffic to Internet Gateway
resource "aws_route_table" "secondary_routetable" {
    provider = aws.secondary
  vpc_id = aws_vpc.secondary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_Ig.id
  }

tags = {
    Name = local.secondary_routetable_name
    environment = var.environment
    Managed_By = var.managed_by  
  }
}
# Associate primary subnet with primary route table
resource "aws_route_table_association" "associationwith_primary" {
    provider = aws.primary
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_routetable.id
}

# Associate secondary subnet with secondary route table
resource "aws_route_table_association" "associationwith_secondary" {
    provider = aws.secondary
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_routetable.id
}

# Route in Primary VPC to reach Secondary VPC via peering

resource "aws_route" "primary_to_secondary" {
    provider = aws.primary
  route_table_id = aws_route_table.primary_routetable.id
  destination_cidr_block = var.secondary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_secondary.id
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_to_primary ]

}

# Route in Secondary VPC to reach Primary VPC via peering

resource "aws_route" "secondary_primary" {
    provider = aws.secondary
  route_table_id = aws_route_table.secondary_routetable.id
  destination_cidr_block = var.primary_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_secondary.id
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_to_primary ]

}



