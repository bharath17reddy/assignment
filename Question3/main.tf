provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "example" {
  key_name   = "terraform-key-name"  
  public_key = file("~/.ssh/id_rsa.pub")   
}
resource "aws_instance" "example" {
  ami           = "ami-0c7217cdde317cfec"   
  instance_type = var.InstanceType
  subnet_id     = var.SubnetId
  key_name      = aws_key_pair.example.key_name
  vpc_id        = var.vpcId

  tags = {
    Name = "Example Instance"
  }
}
resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = var.vpcId

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
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
    Name = "Web-sg"
  }
}



