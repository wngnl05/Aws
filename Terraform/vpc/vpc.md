# VPC
```
# 환경변수 <var,name>
variable "name" {
  type    = string
  default = "test"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "${var.name}-vpc"
  }
}
```

# Public
```
# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-igw"
  }
}
# 퍼블릭 서브넷
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-a"
  }
}
resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-b"
  }
}
# 퍼블릭 라우팅 테이블
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-public-rt"
  }
}
# 퍼블릭 라우팅 테이블 인터넷게이트웨이 연결하기
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
# 퍼블릭 서브넷을 라우팅 테이블에 연결하기
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}
```

# Private
```
# 프라이빗 서브넷 생성
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${var.name}-private-a"
  }
}
# 탄력적 IP
resource "aws_eip" "eip_1" {
  vpc   = true
  lifecycle {
    create_before_destroy = true
  }
}
# Nat Gateway
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.eip_1.id
  subnet_id = aws_subnet.public_a.id
  tags = {
    Name = "nat-a"
  }
}
# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-private-a-rt"
  }
}
# Natgateway 연결
resource "aws_route" "private_a" {
  route_table_id         = aws_route_table.private_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_a.id
}
# 프라이빗 서브넷 연결
resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}



# 프라이빗 서브넷 생성
resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
    Name = "${var.name}-private-b"
  }
}
# 탄력적 IP
resource "aws_eip" "eip_2" {
  vpc   = true
  lifecycle {
    create_before_destroy = true
  }
}
# Nat Gateway
resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.eip_2.id
  subnet_id = aws_subnet.public_b.id
  tags = {
    Name = "nat-b"
  }
}
# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-private-b-rt"
  }
}
# Natgateway 연결
resource "aws_route" "private_b" {
  route_table_id         = aws_route_table.private_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_b.id
}
# 프라이빗 서브넷 연결
resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_b.id
}
```
