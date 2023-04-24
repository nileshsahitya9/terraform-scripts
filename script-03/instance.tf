resource "aws_key_pair" "terraform_instance_03" {
  key_name   = "terraform"
  public_key = file("terraformkey.pub")
}

resource "aws_instance" "terraform-instance-03" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terraform_instance_03.key_name
  vpc_security_group_ids = ["sg-06a21b8e024a8159c"]
  tags = {
    Name    = "terraform-Instance"
    Project = "terraform"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x  /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terraformkey")
    host        = self.public_ip
  }
}
