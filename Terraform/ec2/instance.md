# Create Ec2 Instance
```
resource "aws_instance" "<이름>" {
  ami           = "<AMI>" #ami-05e02e6210658716f (Amazon Linux)
  instance_type = "t2.micro"
  subnet_id     = <Subnet ID>

  vpc_security_group_ids = [
    <보안 그룹 ID>,
  ]

   # 사용자 데이터
   user_data = <<-EOF
        #!/bin/bash
        echo 'Port 2220' >> /etc/ssh/sshd_config
        systemctl restart sshd
        sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
        echo "ec2-user:1111" | chpasswd
        systemctl restart sshd
        EOF

  tags = {
    Name = "skills-ec2"
  }
}
```
