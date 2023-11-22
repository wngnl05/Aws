# Private Subnet
```
# 프라이빗 서브넷 생성
resource "aws_subnet" "private_a" {
  vpc_id     = <VPC ID>
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "${var.name}-private-a"
  }
}
```
<br/>

# Create EIP
```
# 탄력적 IP
resource "aws_eip" "eip_1" {
  vpc   = true
  lifecycle {
    create_before_destroy = true
  }
}
```
<br/>

# Create NatGateway
```
# Nat Gateway
resource "aws_nat_gateway" "nat_a" {
  allocation_id = <EIP ID>
  subnet_id = <Public Subnet ID>
  tags = {
    Name = "nat-a"
  }
}
```
<br/>

# Create Route Table
```
# 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "private_a" {
  vpc_id = <VPC ID>
  tags = {
    Name = "${var.name}-private-a-rt"
  }
}
```
<br/>

# Conect NatGateway to RouteTable
```
# Natgateway 연결
resource "aws_route" "private_a" {
  route_table_id         = <RouteTable ID>
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = <NatGateway ID>
}
```
<br/>

# Conect Subnet to RouteTable
```
# 프라이빗 서브넷 연결
resource "aws_route_table_association" "private_a" {
  subnet_id      = <PrivateSubnet ID>
  route_table_id = <RouteTable ID>
}
```
