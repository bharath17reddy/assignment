variable "Region" {
  description = "AWS region where the instance will be deployed"
}

variable "KeyName" {
  description = "Name of the SSH key to be installed on the instance"
}

variable "InstanceType" {
  description = "EC2 instance type"
}

variable "SubnetId" {
  description = "ID of the subnet where the instance will be deployed"
}

variable "VpcId" {
  description = "ID of the VPC where the instance will be deployed"
}
