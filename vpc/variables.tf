variable "cidr_block" {

  type        = string
  description = "This is a variable for cidr_block"

  default = "10.0.0.0/16"

}

variable "vpc_name" {
  type = string

}

variable "private_subnet_ip_range" {

  type = string

  default = "10.0.1.0/24"

}

variable "public_subnet_ip_range" {

  type = string

  default = "10.0.2.0/24"

}

variable "ami_image" {

  type = string

}

variable "instance_type" {

  type = string

}

variable "subnets" {

  type = any

}

variable "inbound_rule" {

  type = any

}

variable "vm" {
  type = any
}