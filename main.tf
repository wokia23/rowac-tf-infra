#Creating web server for airbnb

terraform {
  required_version = ">= 1.0.0"
}

resource "aws_instance" "airbnb-web-server" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-web-server"
  }
}

#Creating prod server for airbnb
resource "aws_instance" "airbnb-prod-server" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-prod-server"
  }
}

resource "aws_instance" "airbnb-geo-server" {
  ami           =var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "airbnb-geo-server"
  }
}
