provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "example" {
  key_name   = "bharath-key-name"  
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


