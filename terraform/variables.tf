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
  default     = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI for us-east-1
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

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-terraform-bucket-12345"
}

variable "db_instance_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "my-rds-instance"
}

variable "db_engine" {
  description = "Database engine for RDS"
  type        = string
  default     = "mysql"
}

variable "db_instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  default     = "password123"
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database in GB"
  type        = number
  default     = 20
}