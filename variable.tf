variable "enable_dns_hostnamee" {
    type = bool
    default = true  
}
variable "enable_dns_supports" {
    type = bool
    default = true
  
}
variable "instance_type" {
    type = string
    default = "t3.micro"
  
}
variable "primary_cidr_block" {
    default = "10.0.0.0/16"
}

variable "secondary_cidr_block" {
    default = "10.1.0.0/16"
}
variable "primarySubnet_cidr_block" {
    default = "10.0.0.0/24"
}

variable "secondarySubnet_cidr_block" {
    default = "10.1.0.0/24"
}

variable "primary_region" {
    default = "ap-south-1"
}

variable "secondary_region" {
    default = "us-east-1"
}

variable "environment" {
    type = string
  default = "staging"
}

variable "name" {
    type = string
    default = "resource"
 
}
variable "managed_by" {
    type = string
    default = "terraform_user"
}

variable "primary_sg_Ingress_rule" {
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        description = string
    }))
    default = [ {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH from anywhere"
    } ,
    { 
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks = ["10.1.0.0/16"]
      description = "ICMP from Secondary VPC"
    } ,
    {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["10.1.0.0/16"]
        description = "All traffic from Secondary VPC"
    } ]
} 
variable "primary_sg_egress_rule" {
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        description = string
    }))
    default = [ {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow all outbond traffic"
    } ]

}

variable "secondary_sg_Ingress_rule" {
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        description = string
    }))
    default = [ {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH from anywhere"
    } ,
    { 
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks = ["10.0.0.0/16"]
      description = "ICMP from Secondary VPC"
    } ,
    {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
        description = "All traffic from Secondary VPC"
    } ]
} 
variable "secondary_sg_egress_rule" {
    type = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        description = string
    }))
    default = [ {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow all outbond traffic"
    } ]

}

variable "primary_key_name" {
  description = "Name of the SSH key pair for Primary VPC instance (us-east-1)"
  type        = string
  default = "primary_key"
}

variable "secondary_key_name" {
  description = "Name of the SSH key pair for Secondary VPC instance (us-west-2)"
  type        = string
  default = "secondary_key"
}