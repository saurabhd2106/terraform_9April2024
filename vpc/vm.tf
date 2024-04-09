
resource "aws_instance" "ec2" {


  for_each = var.vm

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  vpc_security_group_ids      = [lookup(local.sg, each.value.secruity_group)]
  subnet_id                   = aws_subnet.subnet[each.value.subnet].id
  associate_public_ip_address = each.value.associate_public_ip_address
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabhs public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = each.key
  }


}

locals {
  sg = {
    public_sg = aws_security_group.allow_different_traffic.id

    private_sg = aws_security_group.private_security_group.id
  }
}

