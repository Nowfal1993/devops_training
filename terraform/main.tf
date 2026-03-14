
# Create a Security Group
resource "aws_security_group" "sg1" {
  name        = var.security_group_name
  description = var.security_group_description

  # Allow SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-instance-sg"
  }
}

# Create an EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  vpc_security_group_ids = [aws_security_group.sg1.id]
  
  tags = {
    Name = "terraform-web-server"
    Environment = var.env
  }
}

# Create an S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.env
  }
}

# Create an RDS Instance
resource "aws_db_instance" "my_db" {
  identifier             = var.db_instance_identifier
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  allocated_storage      = var.db_allocated_storage
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name        = var.db_instance_identifier
    Environment = var.env
  }
}
