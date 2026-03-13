
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
