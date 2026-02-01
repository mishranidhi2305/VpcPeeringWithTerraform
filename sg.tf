# Primary VPC Security Group
# - Allows inbound rules defined in var.primary_sg_Ingress_rule
# - Allows outbound rules defined in var.primary_sg_egress_rule
# - Associated with Primary VPC

resource "aws_security_group" "primary_sg" {
    provider = aws.primary
  name        = "primary_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.primary_vpc.id

dynamic "ingress" {
    for_each = var.primary_sg_Ingress_rule
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    } 
}

dynamic "egress" {
    for_each = var.primary_sg_egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

tags = {
    Name = local.primary_sg_tag
    environment = var.environment
    Managed_By = var.managed_by
}


}

# Secondary VPC Security Group
# - Allows inbound rules defined in var.secondary_sg_Ingress_rule
# - Allows outbound rules defined in var.secondary_sg_egress_rule
# - Associated with Secondary VPC

resource "aws_security_group" "secondary_sg" {
    provider = aws.secondary
  name        = "secondary_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.secondary_vpc.id

dynamic "ingress" {
    for_each = var.secondary_sg_Ingress_rule
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    } 
}

dynamic "egress" {
    for_each = var.secondary_sg_egress_rule
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

tags = {
   Name = local.secondary_sg_tag
    environment = var.environment
    Managed_By = var.managed_by
}

}









