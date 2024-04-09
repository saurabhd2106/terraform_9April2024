resource "aws_security_group" "allow_different_traffic" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myVpc.id

  dynamic "ingress" {

    for_each = var.inbound_rule

    content {

      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks

    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "private_security_group" {

  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myVpc.id

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "-1"
    cidr_blocks = [aws_subnet.subnet["public_subnet"].id]

  }

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "private_security_grop"
  }


}