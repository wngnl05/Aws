# Create Security Group
```
resource "aws_security_group" "skills-sg" {
  name_prefix   = "skills-sg"
  description   = "Example security group"
  vpc_id        = <VPC ID>

  # 인바운드 규칙 정의
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2220
    to_port     = 2220
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 아웃바운드 규칙 정의
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #모든 트래픽 허용
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "skills-sg"
  }
}
```
