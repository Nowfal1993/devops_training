variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}


variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "terraform-instance-sg"
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for Terraform EC2 instance"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance (Amazon Linux 2)"
  type        = string
  default     =  var.ami_id  # Amazon Linux 2 AMI (update based on your region)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "env" {
  description = "Environment tag for the EC2 instance"
  type        = string
  default     = "dev"
}