resource "aws_instance" "myserver" {

  ami = var.ami_image_id

  instance_type = var.instance_type

  tags = {
    "Name" = var.ec2_name[count.index]
    "env"  = "dev"
  }

  count = length(var.ec2_name)

}