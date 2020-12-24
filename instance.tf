resource "aws_security_group" "securitygrp_tf" {
  name        = "security_grp_tf"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_tf"
  }
}
resource "aws_instance" "example" {
  ami= "ami-04d29b6f966df1537"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.securitygrp_tf.id]
  key_name = aws_key_pair.mykeypair.key_name
  tags = {
    Name = "ec2_tf"
  }
}