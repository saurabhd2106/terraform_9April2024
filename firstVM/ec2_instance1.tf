data "aws_vpc" "vpc_prathima" {

    id = "vpc-055be49716d7a2227"
  
}

resource "aws_subnet" "subnet" {

  vpc_id = data.aws_vpc.vpc_prathima.id


  cidr_block = "10.0.0.0/16"


  map_public_ip_on_launch = true


  availability_zone = "us-east-1a"


  tags = {
    Name = "myVM-saurabh"
  }


}

