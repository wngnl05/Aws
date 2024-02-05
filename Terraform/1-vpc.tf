# 환경변수 정의 
variable "Vpc_Content" {
  default = {
    default_name       = "wngnl"
    vpc_name           = "wngnl-vpc"
    vpc_cidr           = "10.0.0.0/16"
    public_subnet_name = ["wngnl-pub-a", "wngnl-pub-b", "wngnl-pub-c"]
    public_cidr        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_subnet_name = ["wngnl-priv-a", "wngnl-priv-b", "wngnl-priv-c"]
    private_cidr        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  }
}

# VPC 생성
resource "aws_vpc" "vpc" {
  cidr_block           = var.Vpc_Content.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = var.Vpc_Content.vpc_name }
}



# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.Vpc_Content.default_name}-igw" }
}
# 퍼블릭 라우팅 테이블 생성 및 인터넷게이트 웨이 연결
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.Vpc_Content.default_name}-public-rt" }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
# 퍼블릭 서브넷 생성
resource "aws_subnet" "public_subnet" {
  count                  = length(var.Vpc_Content.public_subnet_name)
  vpc_id                 = aws_vpc.vpc.id
  cidr_block             = var.Vpc_Content.public_cidr[count.index]
  availability_zone      = "ap-northeast-2${element(["a", "b", "c"], count.index)}"
  map_public_ip_on_launch = true
  tags                   = { Name = var.Vpc_Content.public_subnet_name[count.index] }
}
# 퍼블릭 라우팅 테이블에 연결
resource "aws_route_table_association" "public_association" {
  count      = length(var.Vpc_Content.public_subnet_name)
  subnet_id  = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}




# 프라이빗 서브넷 생성
resource "aws_subnet" "private_subnet" {
  count                  = length(var.Vpc_Content.private_subnet_name)
  vpc_id                 = aws_vpc.vpc.id
  cidr_block             = var.Vpc_Content.private_cidr[count.index]
  availability_zone      = "ap-northeast-2${element(["a", "b", "c"], count.index)}"
  tags                   = { Name = var.Vpc_Content.private_subnet_name[count.index] }
}
# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private" {
  count = length(var.Vpc_Content.private_subnet_name)
  vpc_id = aws_vpc.vpc.id
  tags   = { Name = "${var.Vpc_Content.private_subnet_name[count.index]}-rt" }
}
# Nat Gateway 생성
resource "aws_nat_gateway" "nat" {
  count          = length(var.Vpc_Content.public_subnet_name)
  allocation_id  = aws_eip.nat[count.index].id
  subnet_id      = aws_subnet.public_subnet[count.index].id
  tags           = { Name = "${var.Vpc_Content.default_name}-nat-${count.index + 1}" }
}
# Natgateway 및 프라이빗 서브넷 연결
resource "aws_route" "private" {
  count                  = length(var.Vpc_Content.private_subnet_name)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}
# 프라이빗 서브넷 연결
resource "aws_route_table_association" "private_association" {
  count           = length(var.Vpc_Content.private_subnet_name)
  subnet_id       = aws_subnet.private_subnet[count.index].id
  route_table_id  = aws_route_table.private[count.index].id
}
# 탄력적 IP 생성
resource "aws_eip" "nat" {
  count = length(var.Vpc_Content.public_subnet_name)
}
