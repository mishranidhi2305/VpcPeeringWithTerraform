# EC2 Instance in Primary VPC (ap-south-1)
# - Uses latest Ubuntu 22.04 LTS AMI
# - Launched in public subnet of Primary VPC
# - Attached to Primary Security Group
# - Uses existing SSH key pair for login

resource "aws_instance" "primary_instance" {
  provider               = aws.primary
  instance_type = var.instance_type
  ami                    = data.aws_ami.ubuntu_primary.id
  subnet_id              = aws_subnet.primary_subnet.id
  vpc_security_group_ids = [aws_security_group.primary_sg.id]
 depends_on = [
  aws_vpc.primary_vpc
]
  key_name =data.aws_key_pair.primary_key.key_name

  tags = {
    Name = local.primary_ec2_tag
    environment = var.environment
    Managed_By = var.managed_by
  }
  
}

# EC2 Instance in Secondary VPC (us-east-1)
# - Uses latest Ubuntu 22.04 LTS AMI
# - Launched in public subnet of Secondary VPC
# - Attached to Secondary Security Group
# - Uses existing SSH key pair for login

resource "aws_instance" "secondary_instance" {
  provider               = aws.secondary
  instance_type = var.instance_type
  ami                    = data.aws_ami.ubuntu_secondary.id
  subnet_id              = aws_subnet.secondary_subnet.id
  vpc_security_group_ids = [aws_security_group.secondary_sg.id]

 depends_on = [
  aws_vpc.secondary_vpc
]

key_name               = data.aws_key_pair.secondary_key.key_name
  
  tags = {
    Name = local.primary_ec2_tag
    environment = var.environment
    Managed_By = var.managed_by
  }
  
}