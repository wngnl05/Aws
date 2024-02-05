# 환경변수
variable "Ec2_Content" {
    default = {
        default = "wngnl"
        ec2_name = "wngnl-bastion"
        subnet_id = "aws_subnet"
        user_data = "
            #!/bin/bash
            echo 'Port 2220' >> /etc/ssh/sshd_config
            systemctl restart sshd
            sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
            echo "ec2-user:1111" | chpasswd
            systemctl restart sshd
        "
    }
}


# EC2 인스턴스 생성
resource "aws_instance" "wngnl_ec2" {
    ami           = "ami-0c55b159cbfafe1f0"  # 사용할 AMI ID를 설정
    instance_type = "t2.micro"
    subnet_id = aws_subnet.example_subnet.id
    # 사용자 데이터 설정
    user_data = <<-EOF  var.Ec2_Content.user_data  EOF
    tags = { Name = "${var.Ec2_Content.ec2_name}" }
}
# 탄력적 IP 할당
resource "aws_eip" "wngnl_eip" {
    instance = aws_instance.wngnl_ec2.id
    tags = { Name = "${var.Ec2_Content.ec2_name}" }
}
# 보안 그룹 생성
resource "aws_security_group" "wngnl_security_group" {
    vpc_id = aws_subnet.example_subnet.vpc_id
    # 인바운드
    ingress {   
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # 아웃바운드
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = { Name = "${var.Ec2_Content.default}-sg" }
}
