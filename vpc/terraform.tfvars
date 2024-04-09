vpc_name = "myvpc_saurabh"

cidr_block = "10.0.0.0/16"

private_subnet_ip_range = "10.0.1.0/24"
public_subnet_ip_range  = "10.0.2.0/24"

instance_type = "t2.micro"
ami_image     = ""

subnets = {
  public_subnet = {

    cidr_block = "10.0.1.0/24"

    map_public_ip_on_launch = true

    availability_zone = "us-east-1b"

  }

  private_subnet = {

    cidr_block = "10.0.2.0/24"

    map_public_ip_on_launch = false

    availability_zone = "us-east-1a"
  }
}

inbound_rule = {
  allow_http_traffic = {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  allow_ssh_traffic = {


    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  allow_https_traffic = {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

vm = {
  public_vm = {

    ami                         = "10.0.0.0/16"
    instance_type               = "t2.micro"
    key_name                    = "myKey"
    availability_zone           = "us-east-1a"
    subnet                      = "public_subnet"
    secruity_group              = "public_sg"
    associate_public_ip_address = true



  }

  private_vm = {

    ami                         = "10.0.0.0/16"
    instance_type               = "t2.micro"
    key_name                    = "myKey"
    availability_zone           = "us-east-1b"
    subnet                      = "private_subnet"
    secruity_group              = "private_sg"
    associate_public_ip_address = false

  }
}