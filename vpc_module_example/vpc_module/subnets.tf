resource "aws_subnet" "subnet" {

  vpc_id = aws_vpc.myVpc.id


  cidr_block = each.value.cidr_block


  map_public_ip_on_launch = each.value.map_public_ip_on_launch


  availability_zone = each.value.availability_zone


  tags = {
    Name = each.key
  }

  for_each = var.subnets
}

