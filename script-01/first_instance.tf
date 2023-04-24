provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "terraform_instance" {
  ami                    = "ami-02eb7a4783e7e9317"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "jenkinsserver"
  vpc_security_group_ids = ["sg-06a21b8e024a8159c"]
  tags = {
    Name = "terraform-instance"
    Project = "terraform"
  }
}
