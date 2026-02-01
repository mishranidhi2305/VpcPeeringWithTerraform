output "primary_vpcId" {
    value = aws_vpc.primary_vpc.id
}
output "secondary_vpcId" {
    value = aws_vpc.secondary_vpc.id
}
output "primary_subnetId" {
    value = aws_subnet.primary_subnet.id
}
output "secondary_subnetId" {
    value = aws_subnet.secondary_subnet.id
}

output "primary_routetableId" {
    value = aws_route_table.primary_routetable.id
}
output "secondary_routetableId" {
    value = aws_route_table.secondary_routetable.id
}
output "primary_igwId" {
    value = aws_internet_gateway.primary_Ig.id
}
output "secoondary_igwId" {
    value = aws_internet_gateway.secondary_Ig.id
}
output "primary_to_secondary_peeringId" {
    value = aws_vpc_peering_connection.primary_secondary.id
}
output "secondary_to_primary_AccepterId" {
    value = aws_vpc_peering_connection_accepter.secondary_to_primary.id
}
output "primary_sg"{
    value = aws_security_group.primary_sg.id
}
output "secondary_sg"{
    value = aws_security_group.secondary_sg.id
}
output "primary_ec2Id" {
    value = aws_instance.primary_instance.id
}
output "secondary_ec2Id" {
    value = aws_instance.secondary_instance.id
}