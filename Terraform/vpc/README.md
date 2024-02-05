# VPC
```
# 이름 & CIDR 함수 정의
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
<br>


# Public
```
# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.Vpc_Content["default_name"]}-igw" }
}
# 퍼블릭 라우팅 테이블 생성 및 인터넷게이트 웨이 연결하기
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.Vpc_Content["default_name"]}-public-rt" }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


# 퍼블릭 서브넷 A 셍성
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Vpc_Content.public_cidr[0]
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags                    = { Name = var.Vpc_Content.public_subnet_name[0] }
}
# 퍼블릭 서브넷 A를 퍼블릭 라우팅 테이블에 연결
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public.id
}

# 퍼블릭 서브넷 B 셍성
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Vpc_Content.public_cidr[1]
  availability_zone       = "ap-northeast-2b"
  map_public_ip_on_launch = true
  tags                    = { Name = var.Vpc_Content.public_subnet_name[1] }
}
# 퍼블릭 서브넷 B를 퍼블릭 라우팅 테이블에 연결
resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public.id
}

# 퍼블릭 서브넷 C 셍성
resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.Vpc_Content.public_cidr[2]
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags                    = { Name = var.Vpc_Content.public_subnet_name[2] }
}
# 퍼블릭 서브넷 C를 퍼블릭 라우팅 테이블에 연결
resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public.id
}
```
<br>


# Private
```

```
