terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Default AWS Provider (optional)
# - Uses primary region
provider "aws" {
  region = var.primary_region
}

# AWS Provider for Primary Region (ap-south-1)
# - Alias "primary" used for all resources in primary VPC

provider "aws" {
  alias = "primary"
  region = var.primary_region
}

# AWS Provider for Secondary Region (us-east-1)
# - Alias "secondary" used for all resources in secondary VPC
provider "aws" {
  alias = "secondary"
  region = var.secondary_region
  
}