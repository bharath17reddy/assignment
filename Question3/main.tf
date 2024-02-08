provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "example" {
  key_name   = "bharath-key-name"  
  public_key = file("~/.ssh/id_rsa.pub")   
}
resource "aws_instance" "example" {
  ami           = "ami-0c7217cdde317cfec"  # Linux AMI ID, you may need to change this based on your region
  instance_type = var.InstanceType
  subnet_id     = var.SubnetId
  key_name      = var.KeyName
  vpc_id        = var.vpcId

  tags = {
    Name = "Example Instance"
  }
}


