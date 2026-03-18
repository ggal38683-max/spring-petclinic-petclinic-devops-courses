provider "aws" {
  region = var.aws_region
}

# 🔑 key pair
resource "aws_key_pair" "petclinic_key" {
  key_name   = "petclinic-key"
  public_key = file(var.public_key_path)
}

# 🔐 security group
resource "aws_security_group" "petclinic_sg" {
  name = "petclinic-sg"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9090
    to_port   = 9090
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3100
    to_port   = 3100
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 9100
    to_port   = 9100
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # (потім можна обмежити)
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🖥 APP instance
resource "aws_instance" "app" {
  ami           = "ami-0a5b5c0ea66ec560d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.petclinic_key.key_name

  vpc_security_group_ids = [aws_security_group.petclinic_sg.id]

  tags = {
    Name = "petclinic-app"
  }
}

# 🐘 DB instance
resource "aws_instance" "db" {
  ami           = "ami-0a5b5c0ea66ec560d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.petclinic_key.key_name

  vpc_security_group_ids = [aws_security_group.petclinic_sg.id]

  tags = {
    Name = "petclinic-db"
  }
}

# 📊 Monitoring instance
resource "aws_instance" "monitoring" {
  ami           = "ami-0a5b5c0ea66ec560d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.petclinic_key.key_name

  vpc_security_group_ids = [aws_security_group.petclinic_sg.id]

  tags = {
    Name = "petclinic-monitoring"
  }
}

# 🌐 Elastic IP для app
resource "aws_eip" "app_eip" {
  instance = aws_instance.app.id
}
