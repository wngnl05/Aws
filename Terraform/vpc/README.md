# VPC
```
variable "Vpc_Content" {
  default = {
    default_name = "skills"
    vpc_name     = "skills-vpc"
    vpc_cidr     = "10.0.0.0/16"

    public_subnet_name = ["skills-pub-a", "skills-pub-b"]
    public_cidr        = ["10.0.1.0/24", "10.0.2.0/24"]
  }
}

# VPC 생성
resource "aws_vpc" "vpc" {
  cidr_block           = var.Vpc_Content["vpc_cidr"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = var.Vpc_Content["vpc_name"] }
}
```
