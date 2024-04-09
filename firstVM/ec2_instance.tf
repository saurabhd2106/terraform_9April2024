resource "aws_instance" "myserver" {

  ami = var.ami_image_id

  instance_type = var.instance_type

  tags = {
    "Name" = "myserver-saurabh"
 
  }

}