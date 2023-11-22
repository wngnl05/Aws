# Create Public Subnet
```
# 퍼블릭 서브넷
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-a"
  }
}
```
<br/>

# Create Internet Gateway
```
# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-igw"
  }
}
```
<br/>

# Public Route Table
```
# 퍼블릭 라우팅 테이블
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-public-rt"
  }
}
```
<br/>

# Conect Internet Gateway to Route Table
```
# 퍼블릭 라우팅 테이블 인터넷게이트웨이 연결하기
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
```
<br/>

# Conect Subnet to Route Table
```
# 퍼블릭 서브넷을 라우팅 테이블에 연결하기
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}
```
